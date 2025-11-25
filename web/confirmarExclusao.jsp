<%@ page import="br.com.academia.model.Aluno" %>

<%
    Aluno aluno = (Aluno) request.getAttribute("aluno");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmar Exclusão</title>

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f4f4;
            color: #2d3436;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 12px 28px rgba(0,0,0,0.12);
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #d63031;
        }

        p {
            margin: 8px 0;
            font-size: 15px;
        }

        .dados-aluno {
            margin: 18px 0 25px 0;
            padding: 15px;
            border-radius: 8px;
            background-color: #f8f9fa;
            text-align: left;
            font-size: 14px;
            line-height: 1.4;
        }

        .dados-aluno span {
            display: block;
            margin-bottom: 4px;
        }

        .botoes {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 15px;
        }

        a {
            text-decoration: none;
        }

        .btn {
            display: inline-block;
            padding: 9px 20px;
            border-radius: 999px;
            border: none;
            background: #0984e3;
            color: #ffffff;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(9,132,227,0.4);
            transition: 0.15s ease;
        }

        .btn:hover {
            background: #0762a8;
            transform: translateY(-1px);
            box-shadow: 0 7px 14px rgba(9,132,227,0.55);
        }

        .btn-perigo {
            background: #d63031;
            box-shadow: 0 4px 10px rgba(214,48,49,0.4);
        }

        .btn-perigo:hover {
            background: #b22222;
            box-shadow: 0 7px 14px rgba(214,48,49,0.55);
        }

        .btn-neutro {
            background: #b2bec3;
            color: #2d3436;
            box-shadow: 0 4px 10px rgba(178,190,195,0.5);
        }

        .btn-neutro:hover {
            background: #939fa4;
        }
    </style>
</head>
<body>

<div class="container">

    <h1>Confirmar Exclusão</h1>

    <p>Tem certeza que deseja excluir o aluno abaixo?</p>

    <div class="dados-aluno">
        <span><strong>Nome:</strong> <%= aluno != null ? aluno.getNome() : "" %></span>
        <span><strong>CPF:</strong> <%= aluno != null ? aluno.getCpf() : "" %></span>
        <span><strong>Plano:</strong> <%= aluno != null ? aluno.getPlano() : "" %></span>
        <span><strong>Data Matrícula:</strong> <%= aluno != null ? aluno.getDataMatricula() : "" %></span>
    </div>

    <div class="botoes">
        <a class="btn btn-perigo"
           href="AlunoServlet?acao=excluir&id=<%= aluno != null ? aluno.getId() : 0 %>">
            Sim, excluir
        </a>

        <a class="btn btn-neutro" href="AlunoServlet?acao=listar">
            Voltar para lista
        </a>

        <a class="btn" href="index.jsp">
            Página inicial
        </a>
    </div>

</div>

</body>
</html>
