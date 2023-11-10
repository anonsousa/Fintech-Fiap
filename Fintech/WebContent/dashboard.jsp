<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <!---------------------------------------- Meta Tags ------------------------------------------------->
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-------------------------------------- CDN Bootstrap -------------------------------------------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-------------------------------------- Font Awesome ------------------------------------------>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!----------------------------------------- MEU Css ------------------------------------------------>
    <link rel="stylesheet" href="./css/dashboard.css" />
    <title>Dashboard</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-------------------------------------- Sidebar Left ---------------------------------------------->
        <div class="bg-light" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 fs-4 fw-bold border-bottom">
                <img src="./imgs/dashboard/logo.png" alt="Logo" style="width: 25px;" class="img-fluid me-1">
                <h2><span class="primary-text">E.</span> conomico</h2>
            </div>
            <div class="list-group list-group-flush my-3">
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text active">
                    <img src="./imgs/dashboard/dashboard.png" alt="Dashboard" style="width: 25px;" class="img-fluid me-1">
                </i>Dashboard</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text text-success fw-bold">
                    <img src="./imgs/dashboard/coin.png" alt="Recebimento" style="width: 25px;" class="img-fluid me-1">
                </i>Adicionar Recebimento</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text text-danger fw-bold">
                    <img src="./imgs/dashboard/coin_waste.png" alt="Gasto" style="width: 25px;" class="img-fluid me-1">
                </i>Adicionar Gasto</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                    <img src="./imgs/dashboard/filter.png" alt="Filtro" style="width: 25px;" class="img-fluid me-1">
                    </i>Filtrar Mês</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                    <img src="./imgs/dashboard/suporte.png" alt="Suporte Tecnico" style="width: 25px;" class="img-fluid me-2">Suporte</a>
                <a href="./index.jsp" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Sair</a>
            </div>
        </div>
        <!-------------------------------------- Fim Sidebar Left ------------------------------------------>

        <!------------------------------ Header Page ---------------------------->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0 text-success">Dashboard</h2>
                </div>

                <button class="bg-success navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#"
                                id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-2 "></i>Alan Turing
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Perfil</a></li>
                                <li><a class="dropdown-item" href="#">Configurações</a></li>
                                <li><a class="dropdown-item" href="./home.jsp">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!------------------------------ Fim Header Page ---------------------------->

            <!------------------------------ Section ---------------------------->
            <div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-6">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">R$ 10.000</h3>
                                <p class="fs-5">Recebimento</p>
                            </div>
                            <img src="./imgs/dashboard/coin.png" alt="Recebimento" style="width: 60px;" class="img-fluid">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">R$ 6.000</h3>
                                <p class="fs-5">Gasto</p>
                            </div>
                            <img src="./imgs/dashboard/coin_waste.png" alt="Gasto" style="width: 60px;" class="img-fluid">
                        </div>
                    </div>
                </div>

            <!------------------------------ Fim Section ---------------------------->

            <!------------------------------ Tabela --------------------------------->
                <div class="row my-5">
                    <h3 class="text-success fs-4 mb-3">Histórico</h3>
                    <div class="col">
                        <table class="table bg-white rounded shadow-sm table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Tipo</th>
                                    <th scope="col">Valor</th>
                                    <th scope="col">Data</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Notebook</td>
                                    <td><img src="./imgs/dashboard/coin_waste.png" alt="" style="width: 20px;"></td>
                                    <td>R$1.200</td>
                                    <td>26/06/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Freelance</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$750</td>
                                    <td>24/06/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Celular</td>
                                    <td><img src="./imgs/dashboard/coin_waste.png" alt="" style="width: 20px;"></td>
                                    <td>R$600</td>
                                    <td>22/06/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>Aluguel</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$300</td>
                                    <td>20/06/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>Vinícius</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$120</td>
                                    <td>15/06/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">6</th>
                                    <td>Shopping</td>
                                    <td><img src="./imgs/dashboard/coin_waste.png" alt="" style="width: 20px;"></td>
                                    <td>R$150</td>
                                    <td>26/05/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">7</th>
                                    <td>Lanche</td>
                                    <td><img src="./imgs/dashboard/coin_waste.png" alt="" style="width: 20px;"></td>
                                    <td>R$75</td>
                                    <td>23/05/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">8</th>
                                    <td>Mãe</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$36</td>
                                    <td>18/05/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">9</th>
                                    <td>Lucas</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$255</td>
                                    <td>15/05/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">10</th>
                                    <td>Salário</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$4.000</td>
                                    <td>13/05/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">11</th>
                                    <td>Viagem</td>
                                    <td><img src="./imgs/dashboard/coin_waste.png" alt="" style="width: 20px;"></td>
                                    <td>R$1.236</td>
                                    <td>10/05/23</td>
                                </tr>
                                <tr>
                                    <th scope="row">12</th>
                                    <td>Joyce</td>
                                    <td><img src="./imgs/dashboard/coin.png" alt="" style="width: 20px;"></td>
                                    <td>R$422</td>
                                    <td>02/05/23</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            <!------------------------------ Fim Tabela --------------------------------->
            </div>
        </div>
    </div>



    <!-- Script jS Bootstrap e Wrapper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
    <!-- Fim Script jS Bootstrap e Wrapper -->
</body>

</html>