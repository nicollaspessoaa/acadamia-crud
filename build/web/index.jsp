<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sistema de Academia</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body.home {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: radial-gradient(circle at top left, #00b894 0, #0984e3 40%, #2d3436 100%);
                font-family: Arial, Helvetica, sans-serif;
            }

            .home-wrapper {
                width: 100%;
                max-width: 900px;
                padding: 20px;
            }

            .home-card {
                background: #ffffff;
                padding: 40px 35px;
                border-radius: 16px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.20);
                text-align: center;
            }

            .home-title {
                font-size: 28px;
                margin-bottom: 10px;
                color: #1e272e;
            }

            .home-subtitle {
                font-size: 15px;
                color: #636e72;
                margin-bottom: 25px;
            }

            .home-actions {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-bottom: 20px;
                flex-wrap: wrap;
            }

            .home-footer {
                font-size: 12px;
                color: #b2bec3;
            }

            a {
                text-decoration: none;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                border-radius: 999px;
                border: none;
                background: #0984e3;
                color: #ffffff;
                font-size: 14px;
                font-weight: bold;
                cursor: pointer;
                transition: transform 0.15s ease, box-shadow 0.15s ease, background 0.15s ease;
                box-shadow: 0 6px 14px rgba(9, 132, 227, 0.4);
            }

            .btn:hover {
                background: #0762a8;
                transform: translateY(-1px);
                box-shadow: 0 10px 18px rgba(9, 132, 227, 0.55);
            }

            .btn-secundario {
                background: #00b894;
                box-shadow: 0 6px 14px rgba(0, 184, 148, 0.4);
            }

            .btn-secundario:hover {
                background: #019670;
                box-shadow: 0 10px 18px rgba(0, 184, 148, 0.55);
            }
        </style>
    </head>
    <body class="home">

        <div class="home-wrapper">
            <div class="home-card">
                <h1 class="home-title">Sistema de Academia</h1>
                <p class="home-subtitle">
                    Bem-vindo! Gerencie matrículas, planos e alunos de forma simples e rápida.
                </p>

                <div class="home-actions">
                    <a class="btn" href="AlunoServlet?acao=listar">Listar alunos</a>
                    <a class="btn" href="AlunoServlet?acao=novo">Cadastrar novo aluno</a>
                    <a class="btn btn-secundario" href="FinanceiroServlet" >Consultar Financeiro</a>
                </div>
            </div>
        </div>

    </body>
</html>