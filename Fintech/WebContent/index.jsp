<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-BR">

<head>

    <!--------------------------- Meta Tags ------------------------------>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E. conomico</title>
    <!--------------------------- CDN Bootstrap --------------------------------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!--------------------------- Google Fonts --------------------------->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <!------------------- Font Awesome ---------------------------------->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--------------------------- MEU CSS -------------------------------->
    <link rel="stylesheet" href="./css/style.css">


</head>

<body class="bg-dark">
    <!------------------------------------- Header da Page -------------------------------------->
    <header>
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-dark border-bottom border-bottom-dark" data-bs-theme="dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#sobre"><span class="E-logo text-success">E.</span> conomico</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-5 me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="#sobre">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#valores">Valores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#equipe">Equipe</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-success" href="./dashboard.jsp">Dashboard</a>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Produtos e Serviços
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Lorem</a></li>
                                    <li><a class="dropdown-item" href="#">Lorem</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Lorem</a></li>
                                </ul>
                            </li>
                        </ul>
                        
					     <button class="btn btn-outline-success" type="submit">
					        <% 
					            // Recuperar o nome do usuário da sessão
					            String nomeDoUsuario = (String) request.getSession().getAttribute("nomeDoUsuario");
					
					            // Verificar se o nome do usuário está presente na sessão
					            if (nomeDoUsuario != null && !nomeDoUsuario.isEmpty()) {
					                out.print(nomeDoUsuario);
					            } else {
					                out.print("Usuario");
					            }
					        %>
					    </button>
					                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!------------------------------------- Fim Header da Page -------------------------------------->



    <!------------------------------------- Primeira Section -------------------------------------->
    <section class="container mt-5 sobre text-light" id="sobre">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-lg-6 mt-5">
                <h2 class="display-5 my-4 myweight"> <span class="text-success">E.</span> conomico</h2>
                <h3 class="mb-4">Controle seus gastos, maximize seus ganhos e alcance a liberdade financeira com nossa gestão inteligente.</h3>
                <a href="" class="btn btn-success btn-lg my-5">Mais Informações</a>
            </div>
            <div class="col-lg-6 text-center">
                <img src="./imgs/teamwork.svg" alt="Trabalho em equipe" class="img-fluid">
            </div>
        </div>
    </section>
    <!------------------------------------- Fim Primeira Section -------------------------------------->


    
    <!------------------------------------- Segunda Section -------------------------------------->
    <section class="container my-5 text-light" id="valores">
        <h2 class="display-5 text-center my-5 myweight text-success"> Nossos Valores</h2>
        <div class="row d-flex align-items-center justify-content-center">
            <div class="col-lg-6 m-0 pe-0">
                <!-- <h4 class="my-1 text-success mt-4">Nossos Valores</h4> -->
                <h4 class="my-title my-4">Fazer a gestão do seu dinheiro é mais importante do que você pensa!</h4>
                <p class="mb-5">Temos o compromisso de guia-lo na sua jornada da liberdade financeira, nosso conceito é ajudar cada vez mais pessoas a realizar seus sonhos, nossa plataforma foi feita pensando na facilidade e responsividade para o usuário. Esperamos que você se sinta em casa usando nossa ferramenta.</p>
                <a href="#" class="btn btn-lg btn-success my-5">Saiba mais</a>
            </div>
            <div class="col-lg-6 text-center mt-0 ps-3">
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="./imgs/carrossel/cr_1.jpg" class="d-block w-100" alt="Conceito">
                        </div>
                        <div class="carousel-item">
                            <img src="./imgs/carrossel/cr_2.jpg" class="d-block w-100" alt="Design">
                        </div>
                        <div class="carousel-item">
                            <img src="./imgs/carrossel/cr_3.jpg" class="d-block w-100" alt="Expectativa">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

            </div>
        </div> 
    </section>
    <!------------------------------------- Fim Segunda Section -------------------------------------->

    <!------------------------------------- Terceira Section -------------------------------------->
    <section class="container my-5 text-light" id="equipe">
        <h4 class="text-center myweight display-5 text-success">Equipe</h4>
        <h3 class="text-center mb-5">São eles que fazem a magia acontecer!</h3>

        <!-- Card 1 -->
        <div class="row d-flex align-items-center justify-content-center">
            <div class="col-lg-3 my-2">
                <div class="card text-center">
                    <img src="./imgs/equipe/card_1.jpg" class="card-img-top" alt="Membro da equipe: Mozart">
                    <div class="card-body">
                        <h4 class="card-title text-success fw-bold">Wolfgang Mozart</h4>
                        <p class="card-text fw-semibold">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempora, cum.</p>
                        <div class="mt-5">
                            <a href="#"><i class="fa-brands fa-github mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-linkedin mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter mx-2 my-icons"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fim Card 1 -->

            <!-- Card 2 -->
            <div class="col-lg-3 my-2">
                <div class="card text-center">
                    <img src="./imgs/equipe/card_2.jpg" class="card-img-top" alt="Membro da equipe: Carl Orff">
                    <div class="card-body">
                        <h4 class="card-title text-success fw-bold">Carl Orff</h4>
                        <p class="card-text fw-semibold">Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, est?</p>
                        <div class="mt-5">
                            <a href="#"><i class="fa-brands fa-github mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-linkedin mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter mx-2 my-icons"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fim Card 2 -->

            <!-- Card 3 -->
            <div class="col-lg-3 my-2">
                <div class="card text-center">
                    <img src="./imgs/equipe/card_3.jpg" class="card-img-top" alt="Membro da equipe: Clara Schumann">
                    <div class="card-body">
                        <h4 class="card-title text-success fw-bold">Clara Schumann</h4>
                        <p class="card-text fw-semibold">Lorem ipsum dolor, sit amet consectetur adipisicing elit. A, consequatur!</p>
                        <div class="mt-5">
                            <a href="#"><i class="fa-brands fa-github mx-2 my-icons icon-card"></i></a>
                            <a href="#"><i class="fa-brands fa-linkedin mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter mx-2 my-icons"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fim Card 3 -->
            
            <!-- Card 4 -->
            <div class="col-lg-3 my-2">
                <div class="card text-center">
                    <img src="./imgs/equipe/card_4.jpg" class="card-img-top" alt="Membro da equipe: Ethel Smyth">
                    <div class="card-body">
                        <h4 class="card-title text-success fw-bold">Ethel Smyth</h4>
                        <p class="card-text fw-semibold">Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus, repellat?</p>
                        <div class="mt-5">
                            <a href="#"><i class="fa-brands fa-github mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-linkedin mx-2 my-icons"></i></a>
                            <a href="#"><i class="fa-brands fa-twitter mx-2 my-icons"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fim Card 4 -->
        </div>
    </section>
<!------------------------------------- Fim Terceira Section -------------------------------------->


<!----------------------------- script Bootstrap jS ----------------------------->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
<!----------------------------- fim script jS ------------------------->
</body>

</html>