<%@ page import="java.util.List" %>
<%@ page import="br.com.academia.model.Aluno" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Alunos</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        h1 {
            margin-bottom: 20px;
            color: #1e272e;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            gap: 10px;
            flex-wrap: wrap;
        }

        a {
            text-decoration: none;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 999px;
            border: none;
            background: #0984e3;
            color: #ffffff;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease, background 0.15s ease;
            box-shadow: 0 4px 10px rgba(9, 132, 227, 0.4);
        }

        .btn:hover {
            background: #0762a8;
            transform: translateY(-1px);
            box-shadow: 0 7px 14px rgba(9, 132, 227, 0.55);
        }

        .btn-secundario {
            background: #00b894;
            box-shadow: 0 4px 10px rgba(0, 184, 148, 0.4);
        }

        .btn-secundario:hover {
            background: #019670;
            box-shadow: 0 7px 14px rgba(0, 184, 148, 0.55);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 5px;
        }

        table th, table td {
            border: 1px solid #ecf0f1;
            padding: 8px 10px;
            text-align: left;
            font-size: 14px;
        }

        table th {
            background-color: #0984e3;
            color: #ffffff;
        }

        table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .acoes-link {
            font-size: 13px;
            color: #0984e3;
            margin: 0 2px;
        }

        .acoes-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">

        <div class="top-bar">
            <h1>Lista de Alunos</h1>

            <div>
                <a class="btn-secundario btn" href="index.jsp">Página inicial</a>
                <a class="btn" href="AlunoServlet?acao=novo">Cadastrar novo aluno</a>
            </div>
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
                if (lista != null) {
                    for (Aluno a : lista) {
            %>
            <tr>
                <td><%= a.getId() %></td>
                <td><%= a.getNome() %></td>
                <td><%= a.getCpf() %></td>
                <td><%= a.getPlano() %></td>
                <td><%= a.getDataMatricula() %></td>
                <td>
                    <a class="acoes-link" href="AlunoServlet?acao=editar&id=<%= a.getId() %>">Editar</a> |
                    <a class="acoes-link" href="AlunoServlet?acao=confirmarExcluir&id=<%= a.getId() %>">Excluir</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

    </div>

</body>
</html>