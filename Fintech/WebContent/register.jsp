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
                    <h2 class="text-center fw-bold fs-2 text-success mt-1">Registre-se</h2>
                    <p class="text-center fw-semibold ">Junte-se aos melhores!</p>
                </div>
                <form action="Register" method="post" name="registroForm"  onsubmit="return validarFormulario();">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control form-control-lg bg-light fs-6" name="nome" placeholder="Nome">
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control form-control-lg bg-light fs-6" name="email" placeholder="Email">
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control form-control-lg bg-light fs-6" name="senha" placeholder="Senha">
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control form-control-lg bg-light fs-6" name="confirm-senha" placeholder="Confirmar Senha">
                        </div>
                        <div class="input-group mb-5 d-flex justify-content-between">
                            
                        </div>
                        <div class="input-group mb-3">
                            <button type="submit" class="btn btn-lg btn-success w-100 fs-6">Registrar</button>
                        </div>                      
                </form>
                    
				    <% 
				        String mensagemErro = (String) request.getAttribute("mensagemErro");
				        if (mensagemErro != null) {
				    %>
				        <div class="alert alert-danger" role="alert">
				            <%= mensagemErro %>
				        </div>
				    <% } %>
            </div>   
        </div>
    </div>
</div>
<!-------------------------- Fim Container Right ---------------------------->
</body>
<script>
    function validarFormulario() {
        var nome = document.forms["registroForm"]["nome"].value.trim();
        var email = document.forms["registroForm"]["email"].value.trim();
        var senha = document.forms["registroForm"]["senha"].value.trim();
        var confirmSenha = document.forms["registroForm"]["confirm-senha"].value.trim();

        // Validar se os campos estão preenchidos
        if (nome === "" || email === "" || senha === "" || confirmSenha === "") {
            alert("Por favor, preencha todos os campos.");
            return false;
        }
        
        var nomeRegex = /^[a-zA-Z]+$/;
        if (!nomeRegex.test(nome)) {
            alert("Por favor, insira um nome válido contendo apenas letras.");
            return false;
        }

        // Validar o formato do email usando uma expressão regular simples
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Por favor, insira um endereço de email válido.");
            return false;
        }

        // Validar se as senhas coincidem
        if (senha !== confirmSenha) {
            alert("As senhas não coincidem.");
            return false;
        }

        // Validar a senha para ter pelo menos 8 caracteres entre letras e números
        var senhaRegex = /^(?=.*[A-Za-z])(?=.*\d).{8,}$/;
        if (!senhaRegex.test(senha)) {
            alert("A senha deve ter pelo menos 8 caracteres, contendo letras e números.");
            return false;
        }
        return true;
    }
</script>
</html>