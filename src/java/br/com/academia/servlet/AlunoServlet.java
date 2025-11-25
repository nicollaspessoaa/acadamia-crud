package br.com.academia.servlet;

import br.com.academia.dao.AlunoDAO;
import br.com.academia.model.Aluno;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AlunoServlet", urlPatterns = {"/AlunoServlet"})
public class AlunoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        AlunoDAO dao = new AlunoDAO();

        try {
            if (acao == null || acao.equals("listar")) {

                List<Aluno> lista = dao.listar();
                request.setAttribute("listaAlunos", lista);
                request.getRequestDispatcher("listar.jsp").forward(request, response);

            } else if ("editar".equals(acao)) {

                int id = Integer.parseInt(request.getParameter("id"));
                Aluno a = dao.buscarPorId(id);
                request.setAttribute("aluno", a);
                request.getRequestDispatcher("form.jsp").forward(request, response);

            } else if ("novo".equals(acao)) {

                request.getRequestDispatcher("form.jsp").forward(request, response);

            } else if ("confirmarExcluir".equals(acao)) {

                int id = Integer.parseInt(request.getParameter("id"));
                Aluno a = dao.buscarPorId(id);
                request.setAttribute("aluno", a);
                request.getRequestDispatcher("confirmarExclusao.jsp").forward(request, response);

            } else if ("excluir".equals(acao)) {

                int id = Integer.parseInt(request.getParameter("id"));
                dao.deletar(id);
                response.sendRedirect("AlunoServlet?acao=listar");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        AlunoDAO dao = new AlunoDAO();

        try {
            if ("salvar".equals(acao)) {
                String idStr = request.getParameter("id");

                String nome = request.getParameter("nome");
                String cpf = request.getParameter("cpf");
                String plano = request.getParameter("plano");
                String dataStr = request.getParameter("dataMatricula");

                String cpfNumerico = cpf.replaceAll("\\D", "");

                if (cpfNumerico.length() != 11 || !cpfNumerico.matches("\\d{11}")) {
                    Aluno aErro = new Aluno();
                    if (idStr != null && !idStr.isEmpty()) {
                        aErro.setId(Integer.parseInt(idStr));
                    }
                    aErro.setNome(nome);
                    aErro.setCpf(cpf);
                    aErro.setPlano(plano);
                    aErro.setDataMatricula(java.sql.Date.valueOf(dataStr));

                    request.setAttribute("aluno", aErro);
                    request.setAttribute("erroCpf", "CPF inválido. Deve conter 11 dígitos numéricos.");
                    request.getRequestDispatcher("form.jsp").forward(request, response);
                    return;
                }

                java.sql.Date dataMatricula = java.sql.Date.valueOf(dataStr);

                Aluno a = new Aluno();
                a.setNome(nome);
                a.setCpf(cpf); 
                a.setPlano(plano);
                a.setDataMatricula(dataMatricula);

                if (idStr == null || idStr.isEmpty()) {
                    dao.inserir(a);
                } else {
                    a.setId(Integer.parseInt(idStr));
                    dao.atualizar(a);
                }

                response.sendRedirect("AlunoServlet?acao=listar");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}