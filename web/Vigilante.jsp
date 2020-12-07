<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>Casa Grande - Conjunto Residencial</title>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
        <meta content="Responsive admin theme build on top of Bootstrap 4" name="description" />
        <meta content="Themesdesign" name="author" />
        <link rel="shortcut icon" href="imagesd/logoB1.png">

        <!-- DataTables -->
        <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.css"/>
        <link href="Vigilante_Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Vigilante_Assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
        <link href="Vigilante_Assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="Vigilante_Assets/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario;
            String nivel;    
            if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
                usuario=sesion.getAttribute("user").toString();
                nivel=sesion.getAttribute("nivel").toString();
        %>
        <!-- Begin page -->
        <div id="wrapper">
            <!-- Top Bar Start -->
            <div class="topbar">
            <!-- LOGO -->
            <div class="topbar-left">
                <a href="Vigilante.jsp" class="logo">
                    <span class="logo-light">
                        <img src="imagesd/logo.png" alt=""> Casa Grande
                    </span>
                    <span class="logo-sm">
                        <img src="imagesd/logo.png" alt="">
                    </span>
                </a>
            </div>
                <nav class="navbar-custom">
                    <ul class="navbar-right list-inline float-right mb-0">                       
                        <!-- language-->
                        <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">
                                <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                    <img src="Vigilante_Assets/images/flags/Col.png" class="mr-2" height="12" alt="" />Español
                                </a>
                            </li>
                            <!-- full screen -->
                            <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">
                                <a class="nav-link waves-effect" href="#" id="btn-fullscreen">
                                    <i class="mdi mdi-arrow-expand-all noti-icon"></i>
                                </a>
                            </li>
                        <li class="dropdown notification-list list-inline-item">
                                <div class="dropdown notification-list nav-pro-img">
                                    <a class="dropdown-toggle nav-link arrow-none nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                        <% 
                                            Connection conn = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql1 = conn.createStatement();
                                            String qry1="select Nombre, Apellido, Telefono, Correo, Nombre_Usuario, Apartamento, Id_Usuario from usuario where Nombre_Usuario='" + usuario +"'";
                                            ResultSet data1 = sql1.executeQuery(qry1);
                                            while(data1.next()){
                                        %>
                                        <img src="Vigilante_Assets/images/users/iconuser.jpg" alt="user" class="rounded-circle"><span class="ml-1 pro-user-name"><% out.print(data1.getString(1));%><i class="mdi mdi-chevron-down"></i> </span><% } %>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <a class="dropdown-item" href="PerfilVigilante.jsp"><i class="mdi mdi-account-circle"></i>Perfil</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item text-danger" href="<% out.print("views/login.jsp?cerrar=true"); %>"><i class="mdi mdi-power text-danger"></i>Cerrar Sesión</a>
                                    </div>
                                </div>
                        </li>
                    </ul>
                   <ul class="list-inline menu-left mb-0">
                    <li class="float-left">
                        <button class="button-menu-mobile open-left waves-effect">
                            <i class="mdi mdi-menu"></i>
                        </button>
                    </li>
                </ul>
                </nav>
            </div>
            <!-- Top Bar End -->
        <!-- ========== Left Sidebar Start ========== -->
        <div class="left side-menu">
            <div class="slimscroll-menu" id="remove-scroll">
                <!--- Sidemenu -->
                <div id="sidebar-menu">
                    <!-- Left Menu Start -->
                    <ul class="metismenu" id="side-menu">
                        <li class="menu-title">Menú</li>
                        <li>
                            <a href="Vigilante.jsp" class="waves-effect">
                                <i class="ti-home"></i><span>Inicio - Casa Grande</span>
                            </a>
                        </li>
                        <li>
                            <a href="Vehiculo_Info.jsp" class="waves-effect">
                                <i class="fas fa-car-crash"></i><span>Información de Vehículos</span>
                            </a>
                        </li>
                        <li class="menu-title">Gestión de Multas</li>
                        <li>
                            <a href="Multas_Info.jsp" class="waves-effect">
                                <i class="fas fa-exclamation-triangle"></i><span>Información de Multas</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Sidebar -->
                <div class="clearfix"></div>
            </div>
        </div>
            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <div class="content">
                    <div class="container-fluid">
                        <div class="page-title-box">
                            <div class="row align-items-center">
                                <div class="col-sm-6">
                                <h4 class="page-title">Casa Grande - Inicio</h4>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                                    <li class="breadcrumb-item active">Inicio</li>
                                </ol>
                            </div>
                            </div><br>
                            <% 
                                Connection conn2 = 
                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                        "root", "");
                                Statement sql2 = conn2.createStatement();
                                String qry2="SELECT Total, Disponible, por_dis, Ocupado, por_ocu, Mantenimiento, por_man FROM porcentaje_parqueadero WHERE 1 ";
                                ResultSet data2 = sql2.executeQuery(qry2);
                                     while(data2.next()){
                            %>
                            <div class="row">
                                <div class="col-sm-6 col-xl-3">
                                    <div class="card">
                                        <div class="card-heading p-4">
                                            <div class="progress mt-4" style="height: 4px;">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mt-2 mb-0">Total de Parqueaderos<span class="float-right">100%</span></p>
                                            <div class="mini-stat-icon float-right">
                                                <i class="fas fa-parking bg-warning text-white"></i>
                                            </div>
                                            <h3 class="mt-4"><% out.print(data2.getString(1));%></h3>                                    
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="card">
                                        <div class="card-heading p-4">
                                            <div class="progress mt-4" style="height: 4px;">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: <% out.print(data2.getString(5));%>%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mt-2 mb-0">Parqueaderos Ocupados<span class="float-right"><% out.print(data2.getString(5));%>%</span></p>
                                            <div class="mini-stat-icon float-right">
                                                <i class="mdi mdi-car-brake-parking bg-primary  text-white"></i>
                                            </div>
                                            <h3 class="mt-4"><% out.print(data2.getString(4));%></h3>
                                        </div>
                                    </div>
                                </div>  
                                <div class="col-sm-6 col-xl-3">
                                    <div class="card">
                                        <div class="card-heading p-4">
                                            <div class="progress mt-4" style="height: 4px;">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: <% out.print(data2.getString(3));%>%" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mt-2 mb-0">Parqueaderos Disponibles<span class="float-right"><% out.print(data2.getString(3));%>%</span></p>
                                            <div class="mini-stat-icon float-right">
                                                <i class="fas fa-car bg-success text-white"></i>
                                            </div>
                                            <h3 class="mt-4"><% out.print(data2.getString(2));%></h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-3">
                                    <div class="card">
                                        <div class="card-heading p-4">
                                            <div class="progress mt-4" style="height: 4px;">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: <% out.print(data2.getString(7));%>%" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mt-2 mb-0">Parqueaderos en Mantenimiento<span class="float-right"><% out.print(data2.getString(7));%>%</span></p>
                                            <div class="mini-stat-icon float-right">
                                                <i class="fas fa-user-cog bg-danger text-white"></i>
                                            </div>
                                            <h3 class="mt-4"><% out.print(data2.getString(6));%></h3>                                   
                                        </div>
                                     </div>
                                </div>
                            </div><% } %>
                            <div class="row">
                            <div class="col-lg-6">
                                <div class="card m-b-30">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="spinner-grow text-success" role="status">
                                                <span class="sr-only">Loading...</span>
                                            </div>
                                            <div class="spinner-grow text-success" role="status">
                                                <span class="sr-only">Loading...</span>
                                            </div>
                                        </div>
                            <h4 class="mt-0 header-title">Casa Grande - REGISTRO VISITANTE</h4>
                            <p>Cada visitante que ingresa a nuestro conjunto residencial debe ser registrado en nuestro plataforma virtual</p>
                            <form class="" action="ControladorVisitante">
                            
                             <div class="form-group">
                                <label>Nombre:</label>
                                <input type="text" name="txtNom" class="form-control" required placeholder="Nombre del Visitante"/>
                            </div> 
                                
                            <div class="row">
                                <div class="col-lg-6">
                                    <label>Placa:</label>
                                    <input type="text" name="txtPla" class="form-control" required placeholder="Placa del Vehiculo Visitante"/><br>
                                </div>
                                <div class="col-lg-6">
                                    <label>Vehiculo:</label>
                                    <input type="text" name="txtVeh" class="form-control" required placeholder="Vehiculo Visitante"/><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Numero de Apartamento:</label>
                                <input type="text" name="txtApa" class="form-control" required placeholder="Apartamento a donde se dirige el Visitante"/>
                            </div> 
                            
                            <div class="form-group">
                                <label>Fecha</label>
                                <input type="date" name="txtFec" class="form-control" required placeholder="Fecha Inicial de Contrato"/>
                            </div>
                            
                            <div class="form-group">
                                <label>Hora de Entrada:</label>
                                <input type="time" name="txtHen" class="form-control" required placeholder="Fecha Final del Contrato"/>
                            </div>
                            <div class="form-group">
                                <label>Numero de Parqueadero:</label>
                                <input type="number" name="txtPar" class="form-control" required placeholder="Numero de Parqueadero"/>
                            </div>
                            <div class="form-group">
                            <div>
                            <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="accion" value="Agregar">Enviar</button>
                            <button type="reset" class="btn btn-secondary waves-effect m-l-5">Limpiar</button>
                            </div>
                            </div>
                            </form>                            
                        </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card m-b-30">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <a class="btn btn-info btn-sm waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modals-center" href="ControladorParqueadero?accion=add">Agregar</a>
                                        </div>
                                        <h4 class="mt-0 header-title">CASA GRANDE - Disponibilidad de Parqueaderos</h4><br>                                       
                                        <div class="table-responsive">
                                            <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Parqueadero</th>
                                                        <th>Apartamento</th>
                                                        <th>Dueño</th>
                                                        <th>Disponibilidad</th>
                                                        <th>Acción</th>
                                                    </tr>
                                                </thead>
                                                <% 
                                                    Connection conn3 = 
                                                        DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                            "root", "");
                                                    Statement sql3 = conn3.createStatement();
                                                    String qry3="SELECT id_parqueadero, numero, apartamento, dueño, disponible FROM parqueadero WHERE 1";
                                                    ResultSet data3 = sql3.executeQuery(qry3);
                                                        while(data3.next()){
                                                %>
                                                <tbody>
                                                    <tr>
                                                        <th><% out.print(data3.getString(1));%></th>
                                                        <td><% out.print(data3.getString(2));%></td>
                                                        <td><% out.print(data3.getString(3));%></td>
                                                        <td><% out.print(data3.getString(4));%></td>
                                                        <td><% out.print(data3.getString(5));%></td>
                                                        <td>
                                                            <ul class="nav nav-pills nav-justified" role="tablist">
                                                               <li class="nav-item waves-effect waves-light">
                                                                   <a class="btn btn-primary btn-sm waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modal-center" href="ControladorParqueadero?accion=editar&id="><i class="fas fa-edit"></i></a>
                                                                   <a type="button" class="btn btn-danger btn-sm waves-effect waves-light" href="ControladorParqueadero?accion=ocupado&id=<% out.print(data3.getString(1));%>"><i class="fas fa-map-marker-alt"></i></a> 
                                                                   <a type="button" class="btn btn-warning btn-sm waves-effect waves-light" href="ControladorParqueadero?accion=mantenimiento&id=<% out.print(data3.getString(1));%>"><i class="fas fa-hammer"></i></a>
                                                               </li>
                                                           </ul>
                                                        </td>
                                                    </tr>
                                                    <% 
                                                        Connection conn7 = 
                                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                                "root", "");
                                                        Statement sql7 = conn7.createStatement();
                                                        String qry7="SELECT id_parqueadero, numero, apartamento, dueño, disponible FROM parqueadero WHERE id_parqueadero = '" + data3.getString(1) +"'";
                                                        ResultSet data7 = sql7.executeQuery(qry7);
                                                            while(data7.next()){
                                                    %>
                                                    <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title mt-0">Casa Grande - Editar Parqueadero</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="ControladorParqueadero">
                                                                        <div class="form-group">
                                                                            <label>Parqueadero:</label>
                                                                            <input type="text" name="txtNum" class="form-control" value="<% out.print(data7.getString(2));%>"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Apartamento:</label>
                                                                            <input type="text" name="txtApa" class="form-control" value="<% out.print(data7.getString(3));%>"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Dueño</label>
                                                                            <input type="text" name="txtDue" class="form-control" value="<% out.print(data7.getString(4));%>"/>
                                                                        </div>                                
                                                                        <div class="form-group">
                                                                            <div>
                                                                                <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="txtid" value="<% out.print(data3.getString(1));%>"><input class="btn btn-primary" type="hidden" name="accion" value="Actualizar">Editar</button>
                                                                                <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </tbody><% } %><% } %>
                                            </table><br>
                                        </div>                                        
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card faq-box border-success">
                                    <div class="card-body">
                                        <% 
                                            Connection conn6 = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql6 = conn6.createStatement();
                                            String qry6="select count(estado) from visitante where estado like '%Activo%'";
                                            ResultSet data6 = sql6.executeQuery(qry6);
                                                while(data6.next()){
                                        %>
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                            <i class="fas fa-id-card-alt bg-success  text-white"></i>
                                            </div>
                                        </div>
                                        <h5 class="text-success">Visitantes Activos</h5>
                                        <h5 class="font-16 mb-3 mt-4">Cantidad de Visitantes Activos: # <% out.print(data6.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card faq-box border-danger">
                                    <div class="card-body">
                                        <% 
                                            Connection conn5 = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql5 = conn5.createStatement();
                                            String qry5="SELECT COUNT(Id_Visitante) FROM visitante";
                                            ResultSet data5 = sql5.executeQuery(qry5);
                                                while(data5.next()){
                                        %>
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                            <i class="fas fa-running bg-danger  text-white"></i>
                                            </div>
                                        </div>
                                        <h5 class="text-danger">Visitantes</h5>
                                        <h5 class="font-16 mb-3 mt-4">Cantidad de Visitantes: # <% out.print(data5.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card m-b-30">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="spinner-grow text-success" role="status">
                                                <span class="sr-only">Loading...</span>
                                            </div>
                                            <div class="spinner-grow text-warning" role="status">
                                                <span class="sr-only">Loading...</span>
                                            </div>
                                            <div class="spinner-grow text-info" role="status">
                                                <span class="sr-only">Loading...</span>
                                            </div>
                                        </div>
                                        <h4 class="mt-0 header-title">Visitantes</h4>
                                        <p class="sub-title">Información importante sobre cada uno de los visitantes que ingresa a nuestro conjunto residencial <code>Casa Grande</code>.
                                        </p>
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nombre</th>
                                                <th>Vehiculo</th>
                                                <th>Placa</th>
                                                <th>Apartamento</th>
                                                <th>Fecha</th>
                                                <th>Hora de Entrada</th>
                                                <th>Parqueadero</th>
                                                <th>Tiempo</th>
                                                <th>Minutos</th>
                                                <th>Hora de Salida</th>
                                                <th>Estado</th>
                                                <th>Acción</th>
                                            </tr>
                                            </thead> 
                                            <% 
                                                Connection conn4 = 
                                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                        "root", "");
                                                Statement sql4 = conn4.createStatement();
                                                String qry4="SELECT Id_Visitante, Nombre, Vehiculo, Placa, Apartamento, Fecha, Hora_Entrada, parqueadero, minutos, Hora_Salida, estado FROM visitante WHERE 1";
                                                ResultSet data4 = sql4.executeQuery(qry4);
                                                    while(data4.next()){
                                            %>
                                            <tbody>
                                            <tr>
                                                <td><% out.print(data4.getString(1));%></td>
                                                <td><% out.print(data4.getString(2));%></td>
                                                <td><% out.print(data4.getString(3));%></td>
                                                <td><% out.print(data4.getString(4));%></td>
                                                <td><% out.print(data4.getString(5));%></td>
                                                <td><% out.print(data4.getString(6));%></td>
                                                <td><% out.print(data4.getString(7));%></td>
                                                <td><% out.print(data4.getString(8));%></td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-sm waves-effect waves-light" id="inicio" onclick="inicio();"><i class="far fa-clock"></i></button>
                                                    <button type="button" class="btn btn-success btn-sm waves-effect waves-light" id="reinicio" onclick="reinicio();"><i class="fas fa-history"></i></button>
                                                </td>
                                                <td>
                                                    <span id="numero"><% out.print(data4.getString(9));%></span>
                                                </td>
                                                <td><% out.print(data4.getString(10));%></td>
                                                <td><% out.print(data4.getString(11));%></td>
                                                <td>
                                                    <ul class="nav nav-pills nav-justified" role="tablist">
                                                       <li class="nav-item waves-effect waves-light">
                                                           <a type="button" class="btn btn-danger btn-sm waves-effect waves-light" href="ControladorVisitante?accion=multado&id=<% out.print(data4.getString(1));%>"><i class="fas fa-hourglass-end"></i></a>
                                                           <a type="button" class="btn btn-warning btn-sm waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modalvi-center" href="ControladorVisitante?accion=editar&id=<% out.print(data4.getString(1));%>"><i class="fas fa-edit"></i></a>
                                                           <a type="button" class="btn btn-info btn-sm waves-effect waves-light" href="ControladorVisitante?accion=terminado&par=<% out.print(data4.getString(8));%>"><i class="fas fa-sign-in-alt"></i></a>
                                                       </li>
                                                   </ul>
                                                </td>
                                            </tr>
                                            <% 
                                                Connection conn8 = 
                                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                        "root", "");
                                                Statement sql8 = conn8.createStatement();
                                                String qry8="SELECT Id_Visitante, Nombre, Vehiculo, Placa, Apartamento, Fecha, Hora_Entrada, Hora_Salida FROM visitante WHERE Id_Visitante = '" + data4.getString(1) +"'";
                                                ResultSet data8 = sql8.executeQuery(qry8);
                                                    while(data8.next()){
                                            %>
                                            <div class="modal fade bs-example-modalvi-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title mt-0">Casa Grande - Actualizar Visitantes</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="ControladorVisitante">                            
                                                                <div class="form-group">
                                                                    <label>Nombre:</label>
                                                                    <input type="text" name="txtNom" class="form-control" value="<% out.print(data8.getString(2));%>" />
                                                                </div> 
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <label>Placa:</label>
                                                                        <input type="text" name="txtPla" class="form-control" value="<% out.print(data8.getString(4));%>" /><br>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <label>Vehiculo:</label>
                                                                        <input type="text" name="txtVeh" class="form-control" value="<% out.print(data8.getString(3));%>" /><br>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Numero de Apartamento:</label>
                                                                    <input type="text" name="txtApa" class="form-control" value="<% out.print(data8.getString(5));%>" />
                                                                </div> 
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <label>Fecha</label>
                                                                        <input type="date" name="txtFec" class="form-control" value="<% out.print(data8.getString(6));%>" /><br>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <label>Hora de Entrada:</label>
                                                                        <input type="time" name="txtHen" class="form-control" value="<% out.print(data8.getString(7));%>" /><br>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Hora de Salida:</label>
                                                                    <input type="time" name="txtHsa" class="form-control" value="<% out.print(data8.getString(8));%>" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <div>
                                                                        <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="txtid" value="<% out.print(data8.getString(1));%>"><input class="btn btn-primary" type="hidden" name="accion" value="Actualizar">Editar</button>
                                                                        <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
<script type="text/javascript">
    var centesimas = 0;
    var segundos = 0;
    var minutos = 0;
    var horas = 0;
    function inicio () {
        control = setInterval(cronometro,10);
    }
    function reinicio () {
        document.getElementById('numero').innerHTML = "00:00:00";
        clearInterval(control);
        centesimas = 0;
        segundos = 0;
        minutos = 0;
        horas = 0;
    }
    function cronometro () {
        document.getElementById('numero').innerHTML ="<div class='reloj'><span id='Horas'>" + horas + "</span>:<span id='Minutos'>" + minutos + "</span>:<span id='Segundos'>" + segundos + "</span></div>";
        if (centesimas < 99) {
            centesimas++;
            if (centesimas < 10) { centesimas = "0"+centesimas }
            Centesimas.innerHTML = ":"+centesimas;
        }
        if (centesimas == 99) {
            centesimas = 00;
        }
        if (centesimas == 0) {
            segundos ++;
            if (segundos < 10) { segundos = "0"+segundos }
            Segundos.innerHTML = ":"+segundos;
        }
        if (segundos == 30 && centesimas == 00) {
            swal({
                title: "¡Advertencia!",
                text:  "El vehículo ya excedió su tiempo informarle al propietario que salga del conjunto de lo contrario será multado",
                type: 'warning'
            });
        }
        if (segundos == 59) {
            segundos = 00;
        }
        if ( (centesimas == 0)&&(segundos == 0) ) {
            minutos++;
            if (minutos < 10) { minutos = "0"+minutos }
            Minutos.innerHTML = ":"+minutos;
        }
        if (minutos == 1 && segundos == 00 && centesimas == 00) {
            swal({
                title: "¡Multado!",
                text:  "El propietario del vehículo no atendió la advertencia proceder a registrar y cobrar la multa",
                type: 'error'
            });;
        }
        if (minutos == 59) {
            minutos = 00;
        }
        if ( (centesimas == 0)&&(segundos == 0)&&(minutos == 0) ) {
            horas ++;
            if (horas < 10) { horas = "0"+horas }
            Horas.innerHTML = horas;
        }
    }
    
</script>
                                            </tbody><% } %><% } %>
                                        </table>
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    2020 © Casa Grande. - Estamos formando la mejor comunidad para vivir<span class="d-none d-sm-inline-block"></span>.<i class="mdi mdi-heart text-danger"></i>
                </footer>
                <div class="modal fade bs-example-modals-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title mt-0">Casa Grande - Agregar Parqueadero</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
                                     <form action="ControladorParqueadero">
                                         
                                <div class="form-group">
                                    <label>Parqueadero:</label>
                                    <input type="text" name="txtNum" class="form-control" required placeholder="Numero de parqueadero"/>
                                </div>
                                <div class="form-group">
                                    <label>Apartamento:</label>
                                    <input type="text" name="txtApa" class="form-control" required placeholder="Apartamento al que pertenece"/>
                                </div>
                                <div class="form-group">
                                    <label>Dueño</label>
                                    <input type="text" name="txtDue" class="form-control" required placeholder="Dueño del Apartamento"/>
                                </div>
                                <div class="form-group">
                                    <label>Disponibilidad</label>
                                    <input type="text" name="txtDis" class="form-control" required placeholder="Dueño del Apartamento"/>
                                </div>
                                
                            <div class="form-group">
                            <div>
                            <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="accion" value="Agregar">Enviar</button>
                            <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                            </div>
                            </div>
                            </form>
                                 </div>
                             </div><!-- /.modal-content -->
                         </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </div>
        </div>
        <script src="Vigilante_Assets/js/jquery.min.js"></script>
        <script src="Vigilante_Assets/js/bootstrap.bundle.min.js"></script>
        <script src="Vigilante_Assets/js/metismenu.min.js"></script>
        <script src="Vigilante_Assets/js/jquery.slimscroll.js"></script>
        <script src="Vigilante_Assets/js/waves.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.js"></script>
        <!-- Required datatable js -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="plugins/datatables/buttons.bootstrap4.min.js"></script>
        <script src="plugins/datatables/jszip.min.js"></script>
        <script src="plugins/datatables/pdfmake.min.js"></script>
        <script src="plugins/datatables/vfs_fonts.js"></script>
        <script src="plugins/datatables/buttons.html5.min.js"></script>
        <script src="plugins/datatables/buttons.print.min.js"></script>
        <script src="plugins/datatables/buttons.colVis.min.js"></script>
        <!-- Responsive examples -->
        <script src="plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="plugins/datatables/responsive.bootstrap4.min.js"></script>

        <!-- Datatable init js -->
        <script src="Vigilante_Assets/pages/datatables.init.js"></script>   

        <!-- App js -->
        <script src="Vigilante_Assets/js/app.js"></script>
 <%
    }else{
       out.print("<script>location.replace('views/login.jsp');</script>");
    }
%>       
    </body>

</html>