<%@ page import="br.com.academia.model.Aluno" %>

<%
    Aluno aluno = (Aluno) request.getAttribute("aluno");
    boolean editando = (aluno != null);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= editando ? "Editar Aluno" : "Cadastrar Aluno" %></title>

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.10);
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #1e272e;
        }

        .top-buttons {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        a { text-decoration: none; }

        .btn {
            display: inline-block;
            padding: 9px 20px;
            border-radius: 999px;
            background: #0984e3;
            color: #fff;
            font-weight: bold;
            font-size: 14px;
            box-shadow: 0 4px 10px rgba(9,132,227,0.4);
            transition: 0.15s ease;
        }

        .btn:hover {
            background: #0762a8;
            transform: translateY(-1px);
            box-shadow: 0 7px 14px rgba(9,132,227,0.55);
        }

        .btn-secundario {
            background: #00b894;
            box-shadow: 0 4px 10px rgba(0,184,148,0.4);
        }

        .btn-secundario:hover {
            background: #019670;
            box-shadow: 0 7px 14px rgba(0,184,148,0.55);
        }

        form label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            margin-top: 15px;
        }

        form input, form select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
            font-size: 14px;
        }

        .btn-salvar {
            background-color: #6c5ce7;
            box-shadow: 0 4px 10px rgba(108,92,231,0.4);
            margin-top: 25px;
            width: 100%;
            text-align: center;
        }

        .btn-salvar:hover {
            background-color: #574bdb;
        }

        .erro-msg {
            color: #d63031;
            margin-top: 5px;
            font-size: 13px;
            font-weight: bold;
        }

    </style>
</head>
<body>

<div class="container">

    <h1><%= editando ? "Editar Aluno" : "Cadastrar Novo Aluno" %></h1>

    <div class="top-buttons">
        <a href="index.jsp" class="btn-secundario btn">Página Inicial</a>
        <a href="AlunoServlet?acao=listar" class="btn btn-secundario">Lista de Alunos</a>
        <a href="FinanceiroServlet" class="btn btn-secundario">Dashboard Financeiro</a>
    </div>

    <form action="AlunoServlet" method="POST">

        <input type="hidden" name="acao" value="salvar">

        <% if (editando) { %>
            <input type="hidden" name="id" value="<%= aluno.getId() %>">
        <% } %>

        <label>Nome:</label>
        <input type="text" name="nome" required
               value="<%= editando ? aluno.getNome() : "" %>">

        <label>CPF:</label>
        <input type="text" name="cpf" required
               placeholder="Apenas números"
               value="<%= editando ? aluno.getCpf() : "" %>">

        <% if (request.getAttribute("erroCpf") != null) { %>
            <div class="erro-msg"><%= request.getAttribute("erroCpf") %></div>
        <% } %>

        <label>Plano:</label>
        <select name="plano" required>
            <option value="">Selecione...</option>
            <option value="BÁSICO" <%= editando && aluno.getPlano().equals("BÁSICO") ? "selected" : "" %>>BÁSICO</option>
            <option value="PRATA" <%= editando && aluno.getPlano().equals("PRATA") ? "selected" : "" %>>PRATA</option>
            <option value="OURO" <%= editando && aluno.getPlano().equals("OURO") ? "selected" : "" %>>OURO</option>
        </select>

        <label>Data da Matrícula:</label>
        <input type="date" name="dataMatricula" required
               value="<%= editando ? aluno.getDataMatricula() : "" %>">

        <button type="submit" class="btn btn-salvar">Salvar</button>

    </form>

</div>

</body>
</html>
