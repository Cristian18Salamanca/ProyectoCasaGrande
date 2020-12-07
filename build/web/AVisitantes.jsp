<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Visitante"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VisitanteDAO"%>
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
        <link rel="shortcut icon" href="imagesd/logoB2.png">

        <!-- DataTables -->
        <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.css"/>
        <!-- Responsive datatable examples -->
        <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <link href="Admi_Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Admi_Assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
        <link href="Admi_Assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="Admi_Assets/css/style.css" rel="stylesheet" type="text/css">

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
                <a href="Administrador.jsp" class="logo">
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
                                    <img src="Admi_Assets/images/flags/Col.png" class="mr-2" height="12" alt="" />Español
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
                                        <img src="Admi_Assets/images/users/iconuser.jpg" alt="user" class="rounded-circle"><span class="ml-1 pro-user-name"><% out.print(data1.getString(1));%><i class="mdi mdi-chevron-down"></i> </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <a class="dropdown-item" href="PerfilAdministrador.jsp"><i class="mdi mdi-account-circle"></i>Perfil</a>
                                        <a class="dropdown-item" href="InhaApartamentos.jsp"><i class="fas fa-cogs"></i>Censo</a>
                                        <a class="dropdown-item" href="InhaVehiculo.jsp"><i class="mdi mdi-settings"></i>Parqueadero</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item text-danger" href="<% out.print("views/login.jsp?cerrar=true"); %>"><i class="mdi mdi-power text-danger"></i>Cerrar Sesión</a>
                                    </div>
                                </div><% } %>
                            </li>

                    </ul>

                   <ul class="list-inline menu-left mb-0">
                    <li class="float-left">
                        <button class="button-menu-mobile open-left waves-effect">
                            <i class="mdi mdi-menu"></i>
                        </button>
                    </li>
                    <li class="d-none d-md-inline-block">
                        <form role="search" class="app-search">
                            <div class="form-group mb-0">
                                <input type="text" class="form-control" placeholder="Buscar...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
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
                        <li>
                            <a href="Administrador.jsp" class="waves-effect">
                                <i class="ti-home"></i><span>Inicio - Casa Grande</span>
                            </a>
                        </li>
                        
                        <li class="menu-title">Menú - Censo</li>
                        <li>
                            <a href="Censo.jsp" class="waves-effect">
                                <i class="ti-write"></i><span>Información del Censo</span>
                            </a>
                        </li>
                        <li>
                            <a href="Reporte.jsp" class="waves-effect">
                                <i class="fas fa-folder-open"></i><span>Reporte del Censo</span>
                            </a>
                        </li>
                        <li>
                            <a href="AVehiculo.jsp" class="waves-effect">
                                <i class="fas fa-car"></i><span>Información de Vehículos</span>
                            </a>
                        </li>
                        
                        <li class="menu-title">Menú - Visitantes</li>
                        <li>
                            <a href="AVisitantes.jsp" class="waves-effect">
                                <i class="fas fa-car-crash"></i><span>Información de Visitantes</span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="AMultas.jsp" class="waves-effect">
                                <i class="fas fa-exclamation-triangle"></i><span>Información de Multas</span>
                            </a>
                        </li>
                        
                        <li class="menu-title">Menú - Usuarios</li>
                        <li>
                            <a href="Usuarios.jsp" class="waves-effect">
                                <i class="fas fa-users"></i><span>Información de Usuarios</span>
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
                                    <h4 class="page-title">Información de Visitantes</h4>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Inicio</a></li>
                                        <li class="breadcrumb-item active">Información de Visitantes</li>
                                    </ol>
                                </div>
                            </div> <!-- end row -->
                        </div>
                        <div class="row">
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
                                                <td><% out.print(data4.getString(10));%></td>
                                                <td><% out.print(data4.getString(11));%></td>
                                                <td>
                                                    <ul class="nav nav-pills nav-justified" role="tablist">
                                                       <li class="nav-item waves-effect waves-light">
                                                           <a type="button" class="btn btn-danger btn-sm waves-effect waves-light" href="ControladorVisitantea?accion=multado&id=<% out.print(data4.getString(1));%>"><i class="fas fa-hourglass-end"></i></a>
                                                           <a type="button" class="btn btn-warning btn-sm waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modalvi-center" href="ControladorVisitantea?accion=editar&id=<% out.print(data4.getString(1));%>"><i class="fas fa-edit"></i></a>
                                                           <a type="button" class="btn btn-info btn-sm waves-effect waves-light" href="ControladorVisitantea?accion=terminado&par=<% out.print(data4.getString(8));%>"><i class="fas fa-sign-in-alt"></i></a>
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
                                                            <form action="ControladorVisitantea">                            
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
                                            </tbody><% } %><% } %>
                                        </table>
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>  
                    </div>
                </div>
                <footer class="footer">
                2020 © Casa Grande. - Estamos formando la mejor comunidad para vivir<span class="d-none d-sm-inline-block"></span>.<i class="mdi mdi-heart text-danger"></i>
            </footer>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <!-- jQuery  -->
        <script src="Admi_Assets/js/jquery.min.js"></script>
        <script src="Admi_Assets/js/bootstrap.bundle.min.js"></script>
        <script src="Admi_Assets/js/metismenu.min.js"></script>
        <script src="Admi_Assets/js/jquery.slimscroll.js"></script>
        <script src="Admi_Assets/js/waves.min.js"></script>

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
        <script src="Admi_Assets/pages/datatables.init.js"></script>   

        <!-- App js -->
        <script src="Admi_Assets/js/app.js"></script>
<%
    }else{
       out.print("<script>location.replace('views/login.jsp');</script>");
    }
 
%>       
    </body>

</html>