package br.com.academia.servlet;

import br.com.academia.dao.FinanceiroDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FinanceiroServlet")
public class FinanceiroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            FinanceiroDAO dao = new FinanceiroDAO();

            int totalAlunos = dao.getTotalAlunos();
            double totalReceita = dao.getTotalReceita();
            double totalDespesas = totalAlunos * 50;
            double lucro = totalReceita - totalDespesas;

            int qtdBasico = dao.getQtdPlano("basico");
            int qtdPrata = dao.getQtdPlano("prata");
            int qtdOuro = dao.getQtdPlano("ouro");

            request.setAttribute("totalAlunos", totalAlunos);
            request.setAttribute("totalReceita", totalReceita);
            request.setAttribute("totalDespesas", totalDespesas);
            request.setAttribute("lucro", lucro);

            request.setAttribute("qtdBasico", qtdBasico);
            request.setAttribute("qtdPrata", qtdPrata);
            request.setAttribute("qtdOuro", qtdOuro);

            request.getRequestDispatcher("financeiro.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERRO NO FINANCEIRO: " + e.getMessage());
        }
    }
}