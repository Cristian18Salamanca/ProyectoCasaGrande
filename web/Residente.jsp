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
    <%@include file="conexion.jsp"%>
    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <link href="Residente_Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="Residente_Assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
    <link href="Residente_Assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="Residente_Assets/css/style.css" rel="stylesheet" type="text/css">
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
    <div class="header-bg">
        <!-- Navigation Bar-->
        <header id="topnav">
            <div class="topbar-main">
                <div class="container-fluid">
                    <!-- Logo-->
                    <div>
                        <a href="Residente.jsp" class="logo">
                            <span class="logo-light">
                                    <img src="imagesd/logo.png" alt=""> Casa Grande
                            </span>
                        </a>
                    </div>
                    <!-- End Logo-->
                    <div class="menu-extras topbar-custom navbar p-0">
                        <!--Buscar-->
                        <ul class="list-inline d-none d-lg-block mb-0">
                            <li class="hide-phone app-search float-left">
                                <form role="search" class="app-search">
                                    <div class="form-group mb-0">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                        <ul class="navbar-right ml-auto list-inline float-right mb-0">
                            <!--lenguage-->                            
                            <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">
                                <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                    <img src="Residente_Assets/images/flags/Col.png" class="mr-2" height="12" alt="" />Colombia - Español
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
                                            String qry1="select Nombre from usuario where Nombre_Usuario='" + usuario +"'";
                                            ResultSet data1 = sql1.executeQuery(qry1);
                                            while(data1.next()){
                                        %>
                                        <img src="Residente_Assets/images/users/iconuser.jpg" alt="user" class="rounded-circle"><span class="ml-1 pro-user-name"><% out.print(data1.getString(1));%><i class="mdi mdi-chevron-down"></i> </span><% } %>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <a class="dropdown-item" href="PerfilResidente.jsp"><i class="mdi mdi-account-circle"></i>Perfil</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item text-danger" href="<% out.print("views/login.jsp?cerrar=true"); %>"><i class="mdi mdi-power text-danger"></i>Cerrar Sesión</a>
                                    </div>
                                </div>
                            </li>
                            <li class="menu-item dropdown notification-list list-inline-item">
                                <!-- Mobile menu toggle-->
                                <a class="navbar-toggle nav-link">
                                    <div class="lines">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </a>
                                <!-- End mobile menu toggle-->
                            </li>
                        </ul>
                    </div>
                    <!-- end menu-extras -->
                    <div class="clearfix"></div>
                </div>
                <!-- end container -->
            </div>
            <!-- end topbar-main -->
            <!-- MENU Start -->
            <div class="navbar-custom">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">
                            <li class="has-submenu">
                                <a href="Residente.jsp"><i class="ti-home"></i>Inicio - Casa Grande</a>
                            </li>
                            <li class="has-submenu">
                                <a href="Residente_Informacion.jsp"><i class="ti-write"></i>Información Residencial</a>
                            </li>      
                        </ul>
                        <!-- End navigation menu -->
                    </div>
                    <!-- end #navigation -->
                </div>
                <!-- end container -->
            </div>
            <!-- end navbar-custom -->
        </header>
        <!-- End Navigation Bar-->
    </div>
    <!-- header-bg -->
    <div class="wrapper">
        <div class="container-fluid">
            <!-- Page-Title -->
            <div class="page-title-box">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <h4 class="page-title">Información General</h4>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                            <li class="breadcrumb-item active">Información General</li>
                        </ol>
                    </div>
                </div>
                <!-- end row -->
            </div>

            <div class="row">
                <% 
                    Connection conn1 = 
                        DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                            "root", "");
                    Statement sql2 = conn1.createStatement();
                    String qry2="SELECT Niños, por_niñ, Adultos, por_adu, AdultoMayor, por_may, Mascotas FROM censo WHERE MONTH(fecha)=MONTH(CURDATE())";
                    ResultSet data2 = sql2.executeQuery(qry2);
                    while(data2.next()){
                %>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-heading p-4">
                            <div class="mini-stat-icon float-right">
                                <i class="fas fa-baby bg-primary  text-white"></i>
                            </div>
                            <div>
                                <h5 class="font-16">Menores de Edad</h5>
                            </div>
                                <h3 class="mt-4"><% out.print(data2.getString(1));%></h3>
                            <div class="progress mt-4" style="height: 4px;">
                                <div class="progress-bar bg-primary" role="progressbar" style="width: <% out.print(data2.getString(2));%>%" aria-valuenow="<% out.print(data2.getString(2));%>" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p class="text-muted mt-2 mb-0">Porcentaje<span class="float-right"><% out.print(data2.getString(2));%>%</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-heading p-4">
                            <div class="mini-stat-icon float-right">
                                <i class="fas fa-restroom bg-success text-white"></i>
                            </div>
                            <div>
                                <h5 class="font-16">Adultos</h5>
                            </div>
                            <h3 class="mt-4"><% out.print(data2.getString(3));%></h3>
                            <div class="progress mt-4" style="height: 4px;">
                                <div class="progress-bar bg-success" role="progressbar" style="width: <% out.print(data2.getString(4));%>%" aria-valuenow="<% out.print(data2.getString(4));%>" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p class="text-muted mt-2 mb-0">Porcentaje<span class="float-right"><% out.print(data2.getString(4));%>%</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-heading p-4">
                            <div class="mini-stat-icon float-right">
                                <i class="fas fa-blind bg-danger text-white"></i>
                            </div>
                            <div>
                                <h5 class="font-16">Adultos Mayores</h5>
                            </div>
                            <h3 class="mt-4"><% out.print(data2.getString(5));%></h3>
                            <div class="progress mt-4" style="height: 4px;">
                                <div class="progress-bar bg-danger" role="progressbar" style="width: <% out.print(data2.getString(6));%>%" aria-valuenow="<% out.print(data2.getString(6));%>" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p class="text-muted mt-2 mb-0">Porcentaje<span class="float-right"><% out.print(data2.getString(6));%>%</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-heading p-4">
                            <div class="mini-stat-icon float-right">
                                <i class="fas fa-dog bg-warning text-white"></i>
                            </div>
                            <div>
                                <h5 class="font-16">Mascotas</h5>
                            </div>
                            <h3 class="mt-4"><% out.print(data2.getString(5));%></h3>
                            <div class="progress mt-4" style="height: 4px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <p class="text-muted mt-2 mb-0">Porcentaje<span class="float-right">100%</span></p>
                        </div>
                    </div>
                </div>
            </div><% } %>
            <!-- START ROW -->
      
            <div class="row">
                 <div class="col-xl-8">
                    <div class="card m-b-30">
                        <div class="card-body">
                             <h4 class="mt-0 header-title">Quejas y Reclamos</h4>
                            <p class="sub-title">Apreciado Usuario:Para nosotros es muy importante contar con usted. En procura de mejorar nuestros servicios, usted podrá registrar sus solicitudes, quejas, reclamos y/o sugerencias sobre temas de nuestra competencia y de igual forma, consultar información relacionada con nuestro conjunto residencial. </p>        
                            <form action="ControladorQuejas" autocomplete="off">
                                <div class="form-group">
                                    <label>Registrar</label>
                                    <div>
                                        <select name="txtCla" class="form-control">
                                            <option value="">Seleccione una Opción</option>
                                            <option value="Queja">Queja</option>
                                            <option value="Sugerencia">Sugerencia</option>
                                            <option value="Felicitaciones">Felicitaciones</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Correo electrónico de contacto</label>
                                    <div>
                                        <input class="form-control" name="txtCor" type="email" placeholder="casagrande@ejemplo.com" id="example-email-input">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Argumento</label>
                                    <div>
                                        <textarea required name="txtArg" class="form-control" rows="5" placeholder="Argumente su solicitud, queja, reclamo y/o sugerencia"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <button type="submit" class="btn btn-primary waves-effect waves-light">
                                            <input class="btn btn-primary" type="hidden" name="accion" value="Agregar">Enviar
                                        </button>
                                        <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                            Cancelar
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- end col -->
                <div class="col-xl-4">
                    <div class="card m-b-30">
                        <div class="card-body">
                            <h4 class="mt-0 header-title">Casa Grande - Conjunto Residencial</h4>
                            <p class="sub-title">Hagamos del Conjunto Residencial Casa Grande el mejor lugar para vivir, respetando las normas de convivencia, pagando a tiempo las cuotas de administración y participando de sus actividades asi se lograra que los copropietarios de Conjunto Residencial, encuentren y disfruten la mejor alternativa en vivienda, beneficiando su calidad de vida, su seguridad personal, familiar y patrimonial</p>
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-2.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-1.jpg" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid mx-auto" src="imagesd/img-5.jpg" alt="First slide">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Anterior </span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Siguiente</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-xl-12">
                    <div class="card m-b-30">
                        <div class="card-body">
                            <% 
                                Connection con = 
                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                        "root", "");
                                Statement sql = con.createStatement();
                                String qry="select apartamento from usuario where Nombre_Usuario='" + usuario +"'";
                                ResultSet data = sql.executeQuery(qry);
                                while(data.next()){
                            %>
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
                            <h4 class="mt-0 header-title mb-4">Casa Grande - Apartamento <% out.print(data.getString(1));%></h4><% } %>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombres</th>
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">Fecha de Nacimiento</th>
                                            <th scope="col">Teléfono </th>
                                            <th scope="col">Edad</th>
                                            <th scope="col">Rango</th>
                                            <th scope="col">Acción </th>
                                        </tr>
                                    </thead>
                                    <% 
                                        Connection conn2 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql3 = conn2.createStatement();
                                        String qry3="SELECT a.id_persona, a.nombres, a.apellidos, a.nacimiento, a.telefono, a.edad, a.rango FROM personas_rango as a INNER JOIN usuario as u ON a.apartamento = u.apartamento WHERE u.Nombre_Usuario = '" + usuario +"' and MONTH(a.fecha)=MONTH(CURDATE())";
                                        ResultSet data3 = sql3.executeQuery(qry3);
                                        while(data3.next()){
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><% out.print(data3.getString(2));%></td>
                                            <td><% out.print(data3.getString(3));%></td>
                                            <td><% out.print(data3.getString(4));%></td>
                                            <td><% out.print(data3.getString(5));%></td>                     
                                            <td><% out.print(data3.getString(6));%></td>
                                            <td><% out.print(data3.getString(7));%></td>
                                            <td>
                                                <div>
                                                    <!--<a class="btn btn-info btn-sm waves-effect waves-light" href="ControladorPersonas?accion=editar&id=<% out.print(data3.getString(1));%>"><i class="fas fa-pencil-alt"></i></a>-->
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modal-center" href="ControladorParqueadero?accion=editar&id=<% out.print(data3.getString(1));%>"><i class="fas fa-pencil-alt"></i></button>
                                                    <a type="button" class="btn btn-danger waves-effect waves-light" href="ControladorPersonas?accion=eliminar&id=<% out.print(data3.getString(1));%>">Inhabilitar</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <% 
                                            Connection conn5 = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                        "root", "");
                                            Statement sql5 = conn5.createStatement();
                                            String qry5="SELECT nombres, apellidos, nacimiento, telefono, id_persona FROM persona WHERE id_persona = '" + data3.getString(1) +"'";
                                            ResultSet data5 = sql5.executeQuery(qry5);
                                            while(data5.next()){
                                        %>
                                        <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                 <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title mt-0">Casa Grande - Editar Personas</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                             <span aria-hidden="true">&times;</span>
                                                         </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="ControladorPersonas">
                                                            <div class="form-group">
                                                                <label>Nombres :</label>
                                                                <input type="text" name="txtNom" class="form-control" value="<% out.print(data5.getString(1));%>"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Apellido :</label>
                                                                <input type="text" name="txtApe" class="form-control" value="<% out.print(data5.getString(2));%>"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Fecha de Nacimiento :</label>
                                                                <input type="date" name="txtNac" class="form-control" value="<% out.print(data5.getString(3));%>"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Teléfono :</label>
                                                                <input type="number" name="txtTel" class="form-control" value="<% out.print(data5.getString(4));%>"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <div>
                                                                    <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="txtid" value="<% out.print(data5.getString(5));%>"><input class="btn btn-primary" type="hidden" name="accion" value="Actualizar">Editar</button>
                                                                    <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div><% } %><% } %>
                                    </tbody> 
                                </table>
                            </div> 
                        </div>
                    </div>                           
                </div> <!-- end col -->
                
            </div> <!-- end row -->            
            <!-- END ROW -->
            <div class="row">
                <div class="col-lg-5">
                    <div class="card m-b-30">
                        <div class="card-body"> 
                            <h4 class="mt-0 header-title">CASA GRANDE - NO OLVIDAR</h4>
                            <div class="alert alert-danger" role="alert">
                                <strong>¡Aviso!</strong> Es muy importante que llene nuestra información.
                            </div>
                                <p class="m-b-0">Por favor no olvidar actualizar los datos del censo en la primera semana de cada mes, es primordial para nosotros tener un control de nuestro conjunto residencial. Tu colaboración hace que crezcamos como comunidad día a día con el objetivo de hacer que nuestro conjunto sea el mejor lugar para vivir</p>              
                        </div>
                    </div>
                </div> <!-- end col --> 
                <div class="col-lg-7">
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
                            <h4 class="mt-0 header-title">CASA GRANDE - VEHICULOS</h4><br> 
                            <div class="table-responsive">
                            <table class="table table-bordered mb-0">
                                <thead>
                                    <tr>
                                        <th>Placa</th>
                                        <th>Apartamento</th>
                                        <th>Dueño</th>
                                        <th>Marca</th>
                                        <th>Color</th>
                                        <th>Parqueadero</th>
                                        <th>Acción </th>
                                    </tr>
                                </thead>
                                <% 
                                    Connection conn3 = 
                                        DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                            "root", "");
                                    Statement sql4 = conn3.createStatement();
                                    String qry4="SELECT a.Id_Vehiculo, a.Placa, a.apartamento, a.Dueño, a.Marca, a.Color, a.Parqueadero FROM vehiculo as a INNER JOIN usuario as u ON a.apartamento = u.apartamento WHERE u.Nombre_Usuario = '" + usuario +"' and MONTH(a.fecha)=MONTH(CURDATE())";
                                    ResultSet data4 = sql4.executeQuery(qry4);
                                    while(data4.next()){
                                %>
                                <tbody>
                                    <tr>
                                        <th scope="row"><% out.print(data4.getString(2));%></th>
                                        <td><% out.print(data4.getString(3));%></td>
                                        <td><% out.print(data4.getString(4));%></td>
                                        <td><% out.print(data4.getString(5));%></td>
                                        <td><% out.print(data4.getString(6));%></td>
                                        <td><% out.print(data4.getString(7));%></td>
                                        <td><a type="button" class="btn btn-danger btn-sm waves-effect waves-light" href="ControladorVehiculo?accion=eliminar&id=<% out.print(data4.getString(1));%>"><i class="fas fa-trash-alt"></i></a></td>
                                    </tr>
                                </tbody><% } %>
                            </table>
                            </div>
                        </div>
                    </div>
                </div> <!-- end col -->
            </div> <!-- end row -->     
            
        </div>
        <!-- end container-fluid -->
    </div><!-- end wrapper -->
    <!-- Footer -->
    <footer class="footer">
        © 2020 Casa Grande - Conjunto Residencial <span class="d-none d-sm-inline-block"> -  Estamos formando la mejor comunidad para vivir <i class="mdi mdi-heart text-danger"></i></span>.
    </footer>
    <!-- jQuery  -->
    <script src="Residente_Assets/js/jquery.min.js"></script>
    <script src="Residente_Assets/js/bootstrap.bundle.min.js"></script>
    <script src="Residente_Assets/js/jquery.slimscroll.js"></script>
    <script src="Residente_Assets/js/metismenu.min.js"></script>
    <script src="Residente_Assets/js/waves.min.js"></script>
    <!--Morris Chart-->
    <script src="plugins/morris/morris.min.js"></script>
    <script src="plugins/raphael/raphael.min.js"></script>
    <script src="Residente_Assets/pages/dashboard.init.js"></script>
    <!-- App js -->
    <script src="Residente_Assets/js/app.js"></script>    
    
    
    <%
        }else{
            out.print("<script>location.replace('views/login.jsp');</script>");
        }
    %>
    </body>
</html>

       
