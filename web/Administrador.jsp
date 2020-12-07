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
        <link rel="shortcut icon" href="imagesd/logoB2.png">

    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <!-- Responsive datatable examples -->
    <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/c3/c3.min.css" rel="stylesheet" type="text/css"  />
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
                                    </div><% } %>
                                </div>
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
                                <h4 class="page-title">Casa Grande - Inicio</h4>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                                    <li class="breadcrumb-item active">Inicio</li>
                                </ol>
                            </div>
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end page-title -->
                    <div class="row">
                            <div class="col-lg-4">
                                <div class="card faq-box border-danger">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                        <i class="fas fa-user-friends bg-danger  text-white"></i>
                                    </div>
                                        </div>
                                        <% 
                                            Connection conn2 = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql2 = conn2.createStatement();
                                            String qry2="SELECT COUNT(*) FROM `persona` WHERE 1";
                                            ResultSet data2 = sql2.executeQuery(qry2);
                                            while(data2.next()){
                                        %>
                                        <h5 class="text-danger">Residentes</h5>
                                        <h5 class="font-16 mb-3 mt-4">Total de Residentes: # <% out.print(data2.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
    
                            <div class="col-lg-4">
                                <div class="card faq-box border-info">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                        <i class="fas fa-car-side bg-info  text-white"></i>
                                    </div>
                                        </div>
                                        <% 
                                            Connection conn3 = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql3 = conn3.createStatement();
                                            String qry3="SELECT COUNT(*) FROM `vehiculo` WHERE 1";
                                            ResultSet data3 = sql3.executeQuery(qry3);
                                            while(data3.next()){
                                        %>
                                        <h5 class="text-info">Vehículos</h5>
                                        <h5 class="font-16 mb-3 mt-4">Total de Vehículos: # <% out.print(data3.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
    
                            <div class="col-lg-4">
                                <div class="card faq-box border-warning">
                                    <div class="card-body">
                                        <div class="faq-icon float-right">
                                            <div class="mini-stat-icon float-right">
                                        <i class="fas fa-parking bg-warning  text-white"></i>
                                    </div>
                                        </div>
                                        <% 
                                            Connection conn4 = 
                                                DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                    "root", "");
                                            Statement sql4 = conn4.createStatement();
                                            String qry4="SELECT COUNT(*) FROM `parqueadero` WHERE 1";
                                            ResultSet data4 = sql4.executeQuery(qry4);
                                            while(data4.next()){
                                        %>
                                        <h5 class="text-warning">Parqueaderos</h5>
                                        <h5 class="font-16 mb-3 mt-4">Total de Parqueaderos: # <% out.print(data4.getString(1));%></h5>
                                    </div><% } %>
                                </div>
                            </div>
                        </div> 
                    
                    <div class="row">
                            <div class="col-xl-6">
                                <div class="card m-b-30">
                                    <div class="card-body">
        
                                        <h4 class="mt-0 header-title">Grafica Según Genero </h4>
        
                                        <div id="roated-chart"></div>
                                    </div>
                                </div>
                            </div> <!-- end col -->
        
                            <div class="col-xl-6">
                                <div class="card m-b-30">
                                    <div class="card-body">
        
                                        <h4 class="mt-0 header-title">Grafica General del Censo</h4>
        
                                        <div id="combine-chart"></div>
        
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->

                    <!-- end row -->
                    

                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card m-b-30">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title mb-4">Nuestro grupo de trabajo</h4>
                                    <div class="friends-suggestions">
                                        <a href="Usuarios.jsp" class="friends-suggestions-list">
                                            <div class="border-bottom position-relative">
                                                <div class="float-left mb-0 mr-3">
                                                    <img src="Admi_Assets/images/users/user-2.jpg" alt="" class="rounded-circle thumb-md">
                                                </div>
                                                <div class="suggestion-icon float-right mt-2 pt-1">
                                                    <i class="mdi mdi-plus"></i>
                                                </div>

                                                <div class="desc">
                                                    <h5 class="font-14 mb-1 pt-2 text-dark">David Moncada</h5>
                                                    <p class="text-muted">Administrador</p>
                                                </div>
                                            </div>
                                        </a>

                                        <a href="Usuarios.jsp" class="friends-suggestions-list">
                                            <div class="border-bottom position-relative">
                                                <div class="float-left mb-0 mr-3">
                                                    <img src="Admi_Assets/images/users/user-3.jpg" alt="" class="rounded-circle thumb-md">
                                                </div>
                                                <div class="suggestion-icon float-right mt-2 pt-1">
                                                    <i class="mdi mdi-plus"></i>
                                                </div>

                                                <div class="desc">
                                                    <h5 class="font-14 mb-1 pt-2 text-dark">Laura Betancur</h5>
                                                    <p class="text-muted">Aseo General</p>
                                                </div>
                                            </div>
                                        </a>

                                        <a href="Usuarios.jsp" class="friends-suggestions-list">
                                            <div class="border-bottom position-relative">
                                                <div class="float-left mb-0 mr-3">
                                                    <img src="Admi_Assets/images/users/user-4.jpg" alt="" class="rounded-circle thumb-md">
                                                </div>
                                                <div class="suggestion-icon float-right mt-2 pt-1">
                                                    <i class="mdi mdi-plus"></i>
                                                </div>

                                                <div class="desc">
                                                    <h5 class="font-14 mb-1 pt-2 text-dark">Victor Zamora</h5>
                                                    <p class="text-muted">Gefe en Guardia</p>
                                                </div>
                                            </div>
                                        </a>

                                        <a href="Usuarios.jsp" class="friends-suggestions-list">
                                            <div class="border-bottom position-relative">
                                                <div class="float-left mb-0 mr-3">
                                                    <img src="Admi_Assets/images/users/user-5.jpg" alt="" class="rounded-circle thumb-md">
                                                </div>
                                                <div class="suggestion-icon float-right mt-2 pt-1">
                                                    <i class="mdi mdi-plus"></i>
                                                </div>

                                                <div class="desc">
                                                    <h5 class="font-14 mb-1 pt-2 text-dark">Brandon Gomez</h5>
                                                    <p class="text-muted">Guarda Parqueadero</p>
                                                </div>
                                            </div>
                                        </a>

                                        <a href="Usuarios.jsp" class="friends-suggestions-list">
                                            <div class="position-relative">
                                                <div class="float-left mb-0 mr-3">
                                                    <img src="Admi_Assets/images/users/user-6.jpg" alt="" class="rounded-circle thumb-md">
                                                </div>
                                                <div class="suggestion-icon float-right mt-2 pt-1">
                                                    <i class="mdi mdi-plus"></i>
                                                </div>

                                                <div class="desc">
                                                    <h5 class="font-14 mb-1 pt-2 text-dark">James Peralta</h5>
                                                    <p class="text-muted mb-1">Orientador</p>
                                                </div>
                                            </div>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4">
                            <div class="card m-b-30">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Multas</h4>
                                        <p class="sub-title">Cantidad de Multas impuestas.</p><br>
        
                                        <div id="pie-chart"></div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4">
                            <div class="card m-b-30">
                                <div class="card-body">

                                    <h4 class="mt-0 header-title mb-4">Actividades Mensuales </h4>
                                    <ol class="activity-feed mb-0">
                                        <li class="feed-item">
                                            <div class="feed-item-list">
                                                <p class="text-muted mb-1">Mensual</p>
                                                <p class="font-15 mt-0 mb-0">Actualizar todos los datos correspondientes al : <b class="text-primary">Censo - Residentes</b></p>
                                            </div>
                                        </li>
                                        <li class="feed-item">
                                            <p class="text-muted mb-1">Mensual</p>
                                            <p class="font-15 mt-0 mb-0">Regreacion deportiva Familiar, lugar : <b class="text-primary">Parque - Casa Grande</b></p>
                                        </li>
                                        <li class="feed-item">
                                            <p class="text-muted mb-1">Mensual</p>
                                            <p class="font-15 mt-0 mb-0">Junta de acción comunal : <b class="text-primary">Final de Mes</b></p>
                                        </li>
                                        <li class="feed-item pb-1">
                                            <p class="text-muted mb-1">Mensual</p>
                                            <p class="font-15 mt-0 mb-2">Generar : <b class="text-primary">Informe General Residencial</b></p>
                                        </li>

                                    </ol>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- START ROW -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card m-b-30">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Casa Grande - QUEJAS Y RECLAMOS</h4><br>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Quejas"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.QuejasDAO"%>        
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Clasificación</th>
                                                <th>Correo de Contacto</th>
                                                <th>Argumentos</th>
                                                <th>Acción</th>
                                            </tr>
                                            </thead>
        <%
                    QuejasDAO dao=new QuejasDAO();
                    List<Quejas>list=dao.listar();
                    Iterator<Quejas>iter=list.iterator();
                    Quejas que=null;
                    while(iter.hasNext()){
                        que=iter.next();
                    
                %>
                                            <tbody>
                                            <tr>
                                                <td><%= que.getId()%></td>
                                                <td><%= que.getCla()%></td>
                                                <td><%= que.getCor()%></td>
                                                <td><%= que.getArg()%></td>
                                                <td><button type="button" class="btn btn-danger btn-sm waves-effect waves-light"><a href="ControladorQuejas?accion=eliminar&id=<%= que.getId()%>"><i class="far fa-eye-slash"></i></a></button></td>
                                            </tr>
                                             <%}%>                                           
                                            </tbody>
                                        </table>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    
                </div>
                <!-- container-fluid -->

            </div>
            <!-- content -->

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

    <!--Morris Chart-->
    <script src="plugins/morris/morris.min.js"></script>
    <script src="plugins/raphael/raphael.min.js"></script>

    <script src="Admi_Assets/pages/dashboard.init.js"></script>
    
    <!--C3 Chart-->
        <script src="plugins/d3/d3.min.js"></script>
        <script src="plugins/c3/c3.min.js"></script>
        <script src="Admi_Assets/pages/c3-chart-init.js"></script>
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