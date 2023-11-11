<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>

    <!----------------------------- Meta Tags ------------------------>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E. Conomico</title>
    <!-------------------- CDN Bootstrap ----------------------------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!------------------------------- Google Fonts------------------->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <!---------------- MEU CSS---------------------------------------->
    <link rel="stylesheet" href="./css/homecss.css">
</head>

<body class="bg-dark">
    <!-------------------- Container Principal--------------------------->
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
    <!-------------------- Fim Container Principal--------------------------->

    <!-------------------- Container Login --------------------------->
        <div class="row border rounded-5 p-3 bg-white shadow box-area">
    <!-------------------- Fim Container Login --------------------------->

    <!-------------------- Container Left IMG --------------------------->
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #09b8665e;">
            <div class="featured-image mb-3">
                <img src="./imgs/home/login.svg" class="img-fluid" style="width: 250px;" alt="Foto de Login">
            </div>
        </div>
    <!-------------------- Fim Container Left IMG --------------------------->
    
    <!-------------------------- Container Right ---------------------------->
        <div class="col-md-6 right-box">
            <div class="row align-items-center right-box">
                <div class="header-text mb-4">
                    <h2 class="text-center fw-bold fs-2 text-success mt-1">Bem vindo</h2>
                    <p class="text-center fw-semibold ">Estamos felizes em te ver!</p>
                </div>
                <form action="Login" method="post"> <!-- Defina o URL do servlet apropriado -->
                        <div class="input-group mb-3">
                            <input type="text" class="form-control form-control-lg bg-light fs-6" name="login" placeholder="Email">
                        </div>
                        <div class="input-group mb-1">
                            <input type="password" class="form-control form-control-lg bg-light fs-6" name="senha" placeholder="Senha">
                        </div>
                        <div class="input-group mb-5 d-flex justify-content-between">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="formCheck" name="lembrarSenha">
                                <label for="formCheck" class="form-check-label text-secondary"><small>Lembrar senha</small></label>
                            </div>
                            <div class="forgot">
                                <small><a href="#">Esqueci minha senha</a></small>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <button type="submit" class="btn btn-lg btn-success w-100 fs-6">Login</button>
                        </div>
                        
							<% 
								String erro = (String) request.getAttribute("erro");
								if (erro != null) {
							%>
								<div class="alert alert-danger">
							  	  <%= erro %>
								</div>
							<%
								}
							%>
                    </form>
                <div class="input-group mb-3">
                    <button class="btn btn-lg btn-light w-100 fs-6"><img src="./imgs/home/google.png" style="width:20px" alt="Logo da Google"><small class="mx-2">Continuar com Google</small></button>
                </div>
                <div class="row">
                    <small class="text-center">Não tem uma conta? <a href="./register.jsp">Registre-se</a></small>
                </div>
            </div>   
        </div>
    </div>
</div>
<!-------------------------- Fim Container Right ---------------------------->
</body>
</html>