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
            <!-- Sidebar -left -->

        </div>
            <!-- Left Sidebar End -->

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="page-title-box">
                            <div class="row align-items-center">
                                <div class="col-sm-6">
                                    <h4 class="page-title">Información de Vehículos</h4>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Inicio</a></li>
                                        <li class="breadcrumb-item active">Información de Vehículos</li>
                                    </ol>
                                </div>
                            </div> <!-- end row -->
                        </div>
                        <!-- end page-title -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card faq-box border-success">
                                    <% 
                                        Connection conn4 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql4 = conn4.createStatement();
                                        String qry4="SELECT COUNT(estado) FROM vehiculo WHERE estado LIKE '%Entro%'";
                                        ResultSet data4 = sql4.executeQuery(qry4);
                                                while(data4.next()){
                                    %>
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                            <i class="fas fa-car-alt bg-success  text-white"></i>
                                            </div>
                                        </div>
                                        <h5 class="text-success">Vehículos dentro del Conjunto</h5>
                                        <h5 class="font-16 mb-3 mt-4">Cantidad de Vehículos: # <% out.print(data4.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card faq-box border-danger">
                                    <% 
                                        Connection conn3 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql3 = conn3.createStatement();
                                        String qry3="SELECT COUNT(estado) FROM vehiculo WHERE estado LIKE '%Salio%'";
                                        ResultSet data3 = sql3.executeQuery(qry3);
                                                while(data3.next()){
                                    %>
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                        <i class="fas fa-car-side bg-danger  text-white"></i>
                                    </div>
                                        </div>
                                        <h5 class="text-danger">Vehículos fuera del Conjunto</h5>
                                        <h5 class="font-16 mb-3 mt-4">Cantidad de Vehículos: # <% out.print(data3.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
                        </div> 

                       <div class="row">
                        <div class="col-xl-4">
                            <div class="card m-b-30">
                                <div class="card-body">
                                    <% 
                                        Connection conn2 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql2 = conn.createStatement();
                                        String qry2="select Nombre, Apellido, Telefono, Correo, Nombre_Usuario, Apartamento, Id_Usuario from usuario where Nombre_Usuario='" + usuario +"'";
                                        ResultSet data2 = sql2.executeQuery(qry2);
                                                while(data2.next()){
                                    %>
                                    <h4 class="mt-0 header-title">Casa Grande - Mi Información</h4><br>
                                    <div class="alert alert-danger" role="alert">
                                        <strong>¡Aviso!</strong> Es importante que nunca olvides.
                                    </div>
                                    <img src="Vigilante_Assets/images/small/img-12.jpg" class="img-fluid" alt="Responsive image" height="64"><br>
                                    <div class="pricing-features mt-4">
                                            <p class="m-b-0">Un buen vigilante como tu, simpre esta atento previene robos, vandalismo y la violación de la propiedad privada siempre llevar el registros detallado en la bitácora de seguridad, reportar todos los incidentes acontecidos en su turno de trabajo, programar turnos y recorridos para cuidar a su comunidad</p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Cargo: Vigilante</p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Nombre: <% out.print(data2.getString(1));%> <% out.print(data2.getString(2));%></p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Correo: <% out.print(data2.getString(4));%></p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Teléfono: <% out.print(data2.getString(3));%></p>
                                    </div><br><% } %>
                                    <a href="PerfilVigilante.jsp" class="btn btn-success btn-lg w-100 btn-round">Mi Perfil</a><br>
                                </div>
                            </div>
                        </div>
                        <!-- end col -->
                        <div class="col-xl-8">
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
                                    <h4 class="mt-0 header-title">Casa Grande - Vehiculos</h4><br> 
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>Placa</th>
                                                <th>Apartamento</th>
                                                <th>Dueño</th>
                                                <th>Marca</th>
                                                <th>Color</th>
                                                <th>Parqueadero</th>
                                                <th>Estado</th>
                                                <th>Acción</th>
                                            </tr>
                                            </thead>
                                            <% 
                                                Connection conn5 = 
                                                    DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                        "root", "");
                                                Statement sql5 = conn5.createStatement();
                                                String qry5="SELECT `Id_Vehiculo`, `fecha`, `Placa`, `apartamento`, `Dueño`, `Marca`, `Color`, `Parqueadero`, `estado` FROM `vehiculo` WHERE 1";
                                                ResultSet data5 = sql5.executeQuery(qry5);
                                                    while(data5.next()){
                                            %>
                                            <tbody>
                                            <tr>
                                                <td><% out.print(data5.getString(3));%></td>
                                                <td><% out.print(data5.getString(4));%></td>
                                                <td><% out.print(data5.getString(5));%></td>
                                                <td><% out.print(data5.getString(6));%></td>
                                                <td><% out.print(data5.getString(7));%></td>
                                                <td><% out.print(data5.getString(8));%></td>
                                                <td><% out.print(data5.getString(9));%></td>
                                                <td>
                                                    <ul class="nav nav-pills nav-justified" role="tablist">
                                                       <li class="nav-item waves-effect waves-light">
                                                           <a type="button" class="btn btn-info btn-sm waves-effect waves-light" href="ControladorVehiculo?accion=entro&id=<% out.print(data5.getString(1));%>"><i class="fas fa-backward"></i></a>
                                                           <a type="button" class="btn btn-danger btn-sm waves-effect waves-light" href="ControladorVehiculo?accion=salio&id=<% out.print(data5.getString(8));%>"><i class="fas fa-lock-open"></i></a>
                                                       </li>
                                                   </ul>
                                                </td>
                                            </tr>
                                            </tbody><% } %>
                                        </table>
                                </div>
                            </div>
                        </div>                        
                    </div>

                </div>
                <!-- content -->

                <footer class="footer">
                      © 2020 Casa Grande - Conjunto Residencial <span class="d-none d-sm-inline-block"> -  Estamos formando la mejor comunidad para vivir <i class="mdi mdi-heart text-danger"></i></span>.
                </footer>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

        </div></div>
        <!-- END wrapper -->
          
        <!-- jQuery  -->
        <script src="Vigilante_Assets/js/jquery.min.js"></script>
        <script src="Vigilante_Assets/js/bootstrap.bundle.min.js"></script>
        <script src="Vigilante_Assets/js/metismenu.min.js"></script>
        <script src="Vigilante_Assets/js/jquery.slimscroll.js"></script>
        <script src="Vigilante_Assets/js/waves.min.js"></script>

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