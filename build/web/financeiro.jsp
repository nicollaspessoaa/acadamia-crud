<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Financeiro</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        .btn {
            display: inline-block;
            padding: 10px 18px;
            margin-right: 10px;
            text-decoration: none;
            color: #fff;
            border-radius: 6px;
            font-weight: bold;
        }

        .btn-green {
            background-color: #28a745;
        }

        .btn-blue {
            background-color: #007bff;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .tabela {
            width: 70%;
            margin: 20px auto;
            border-collapse: collapse;
            font-size: 18px;
        }

        .tabela th, .tabela td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
        }

        .tabela th {
            text-align: left;
            color: #444;
        }

        .tabela td {
            text-align: right;
            color: #555;
        }

        .subtitulo {
            margin-top: 40px;
            text-align: center;
            font-size: 22px;
            color: #333;
            font-weight: bold;
        }

        hr {
            margin-top: 20px;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Dashboard Financeiro</h1>

    <a href="index.jsp" class="btn btn-green">Página Inicial</a>
    <a href="AlunoServlet?acao=listar" class="btn btn-blue">Lista de Alunos</a>

    <hr><br>

    <h2>Resumo</h2>

    <table class="tabela">
        <tr>
            <th>Total de Alunos</th>
            <td>${totalAlunos}</td>
        </tr>

        <tr>
            <th>Total Arrecadado</th>
            <td>R$ ${totalReceita}</td>
        </tr>

        <tr>
            <th>Total de Despesas (R$ 50 por aluno)</th>
            <td>R$ ${totalDespesas}</td>
        </tr>

        <tr>
            <th>Lucro Final</th>
            <td><b>R$ ${lucro}</b></td>
        </tr>
    </table>

    <h2 class="subtitulo">Resumo por Plano</h2>

    <table class="tabela">
        <tr>
            <th>Plano Básico (R$ 80)</th>
            <td>${qtdBasico}</td>
        </tr>

        <tr>
            <th>Plano Prata (R$ 109)</th>
            <td>${qtdPrata}</td>
        </tr>

        <tr>
            <th>Plano Ouro (R$ 120)</th>
            <td>${qtdOuro}</td>
        </tr>
    </table>

</div>

</body>
</html>
