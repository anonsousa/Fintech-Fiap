<%@ page import="java.math.BigDecimal" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.List" %>
<%@ page import="fintech.dao.GastoDAO" %>
<%@ page import="fintech.model.Gasto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- CDN Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- MEU Css -->
    <link rel="stylesheet" href="./css/dashboard.css" />
    <title>Dashboard</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar Left -->
        <div class="bg-light" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 fs-4 fw-bold border-bottom">
                <img src="./imgs/dashboard/logo.png" alt="Logo" style="width: 25px;" class="img-fluid me-1">
                <h2><span class="primary-text">E.</span> conomico</h2>
            </div>
            <div class="list-group list-group-flush my-3">
                <a href="./dashboard.jsp" class="list-group-item list-group-item-action bg-transparent second-text active">
                    <img src="./imgs/dashboard/dashboard.png" alt="Dashboard" style="width: 25px;" class="img-fluid me-1">
                </i>Dashboard</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text text-danger fw-bold" onclick="abrirModalAdicionarGasto()">
                    <img src="./imgs/dashboard/coin_waste.png" alt="Gasto" style="width: 25px;" class="img-fluid me-1">
                    Adicionar Gasto
                </a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                    <img src="./imgs/dashboard/suporte.png" alt="Suporte Tecnico" style="width: 25px;" class="img-fluid me-2">Suporte</a>
                <a href="./index.jsp" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Sair</a>
            </div>
        </div>

        <!-- Header Page -->
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
                                <i class="fas fa-user me-2"></i>
                                <%
                                    // Recuperar o nome do usuário da sessão
                                    String nomeDoUsuario = (String) request.getSession().getAttribute("nomeDoUsuario");

                                    // Exibir o nome do usuário se presente na sessão, caso contrário, exibir "Usuário"
                                    out.print((nomeDoUsuario != null && !nomeDoUsuario.isEmpty()) ? nomeDoUsuario : "Usuário");
                                %>
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

            <!-- Section -->
            <div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-6">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
								<%
								    // Recuperar o ID do usuário da sessão
								    UUID idUsuario = (UUID) request.getSession().getAttribute("idUsuario");
								
								    // Recuperar o valorTotalGastos associado ao ID do usuário da sessão
								    BigDecimal valorTotalGastos = (BigDecimal) request.getSession().getAttribute("valorTotalGastos_" + idUsuario);
								
								    // Exibir o valorTotalGastos se presente na sessão, caso contrário, exibir "0.00"
								    String valorTotalGastosStr = (valorTotalGastos != null) ? valorTotalGastos.toString() : "0.00";
								%>
								
								<h3 id="valorTotalGastos" class="fs-2">                       
								    R$ <%= valorTotalGastosStr %>
								</h3>
                                <p class="fs-5">Gastos</p>
                            </div>
                            <img src="./imgs/dashboard/coin_waste.png" alt="Gasto" style="width: 60px;" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tabela -->
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
                            <%
                                // Criar uma instância de GastoDAO
                                GastoDAO gastoDAO = new GastoDAO();

                                // Obter o idUsuario da sessão                              

                                // Obter a lista de gastos usando a instância de GastoDAO
                                List<Gasto> gastos = gastoDAO.obterGastos(idUsuario);

                                // Iterar sobre a lista de gastos
                                for (int i = 0; i < gastos.size(); i++) {
                                    Gasto gasto = gastos.get(i);
                            %>
                                    <tr>
                                        <th scope="row"><%= i + 1 %></th>
                                        <td><%= gasto.getNomeGasto() %></td>
                                        <td><img src="./imgs/dashboard/coin_waste.png" alt="" style="width: 20px;"></td>
                                        <td>R$<%= gasto.getValorGasto() %></td>
                                        <td><%= gasto.getDataGasto() %></td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Fim Tabela -->
        </div>
    </div>

    <!-- Modal Adicionar Gasto -->
    <div class="modal fade" id="modalAdicionarGasto" tabindex="-1" aria-labelledby="modalAdicionarGastoLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAdicionarGastoLabel">Adicionar Gasto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <!-- Coloque aqui o conteúdo do seu formulário para adicionar gasto -->
                    <label for="nomeGasto" class="form-label">Nome do Gasto</label>
                    <input type="text" class="form-control" id="nomeGasto">

                    <label for="valorGasto" class="form-label">Valor do Gasto</label>
                    <input type="number" step="0.01" name="quantity" min="0.01" class="form-control" id="valorGasto">

                    <label for="dataGasto" class="form-label">Data do Gasto</label>
                    <input type="date" class="form-control" id="dataGasto">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-success" onclick="adicionarGasto()">Adicionar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- Script jS Bootstrap e Wrapper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>

   <script>

    function abrirModalAdicionarGasto() {
        $('#modalAdicionarGasto').modal('show');
    }

    function adicionarGasto() {
        // Obtenha os valores do formulário
        var nomeGasto = document.getElementById("nomeGasto").value;
        var valorGasto = document.getElementById("valorGasto").value;
        var dataGasto = document.getElementById("dataGasto").value;

        // Valide se todos os campos estão preenchidos
        if (nomeGasto.trim() === '' || valorGasto.trim() === '' || dataGasto.trim() === '') {
            // Se algum campo estiver vazio, exiba uma mensagem ou tome outra ação adequada
            alert("Por favor, preencha todos os campos antes de adicionar o gasto.");
            return;
        }

        // Faça uma requisição AJAX para a servlet
        $.ajax({
            type: "POST",
            url: "adicionarGasto", // Certifique-se de que a servlet esteja mapeada corretamente
            data: {
                nomeGasto: nomeGasto,
                valorGasto: valorGasto,
                dataGasto: dataGasto
            },
            success: function () {
                // Feche o modal após o sucesso
                $('#modalAdicionarGasto').modal('hide');
                location.reload();
            }
        });
    }

    $(document).ready(function () {
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    });

</script>