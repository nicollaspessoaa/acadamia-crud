<%@page import="java.util.List"%>
<%@page import="br.com.academia.model.Aluno"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Listagem de Alunos</title>
    <meta charset="UTF-8">

    <style>

        body { font-family: Arial, sans-serif; margin: 30px; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th { background: #f5f5f5; }

        .top-buttons { margin-bottom: 20px; }
        .top-buttons a {
            padding: 8px 15px;
            background: #0288d1;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
            font-weight: bold;
        }
        .top-buttons a:hover {
            background: #0277bd;
        }

        .btn-acao {
            padding: 8px 14px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            color: #fff;
            margin-right: 8px;
            display: inline-block;
            transition: 0.2s ease;
            font-weight: bold;
        }

        .btn-editar {
            background-color: #0984e3;
            box-shadow: 0 4px 10px rgba(9,132,227,0.3);
        }
        .btn-editar:hover {
            background-color: #086fbd;
            box-shadow: 0 5px 12px rgba(9,132,227,0.45);
            transform: translateY(-1px);
        }

        .btn-excluir {
            background-color: #d63031;
            box-shadow: 0 4px 10px rgba(214,48,49,0.3);
        }
        .btn-excluir:hover {
            background-color: #b92b2c;
            box-shadow: 0 5px 12px rgba(214,48,49,0.45);
            transform: translateY(-1px);
        }

    </style>

</head>

<body>

<h1>Lista de Alunos</h1>

<div class="top-buttons">
    <a href="index.jsp">Página Inicial</a>
    <a href="AlunoServlet?acao=novo">Cadastrar novo aluno</a>
</div>

<%
    List<Aluno> lista = (List<Aluno>) request.getAttribute("listaAlunos");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>CPF</th>
        <th>Plano</th>
        <th>Data Matrícula</th>
        <th>Ações</th>
    </tr>

    <%
        if (lista != null && !lista.isEmpty()) {
            for (Aluno a : lista) {
    %>

        <tr>
            <td><%= a.getId() %></td>
            <td><%= a.getNome() %></td>
            <td><%= a.getCpf() %></td>
            <td><%= a.getPlano() %></td>
            <td><%= a.getDataMatricula() %></td>

            <td>
                <a class="btn-acao btn-editar" href="AlunoServlet?acao=editar&id=<%= a.getId() %>">Editar</a>
                <a class="btn-acao btn-excluir" href="AlunoServlet?acao=confirmarExcluir&id=<%= a.getId() %>">Excluir</a>
            </td>
        </tr>

    <%
            }
        } else {
    %>

        <tr>
            <td colspan="6" style="text-align:center;">Nenhum aluno cadastrado.</td>
        </tr>

    <%
        }
    %>

</table>

</body>
</html>
