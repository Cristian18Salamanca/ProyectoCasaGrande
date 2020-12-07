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

        <!-- DataTables -->
        <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

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
                                    <h4 class="page-title">Reporte Mensual del Censo</h4>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="Administrador.jsp">Casa Grande</a></li>
                                        <li class="breadcrumb-item"><a href="Administrador.jsp">Inicio</a></li>
                                        <li class="breadcrumb-item active">Reporte del Censo</li>
                                    </ol>
                                </div>
                            </div> <!-- end row -->
                        </div>
                        <!-- end page-title -->   
                         <div class="row">
                             <div class="col-xl-4">
                            <div class="card m-b-30">
                                <div class="card-body">
                                    <% 
                                        Connection conn2 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql2 = conn2.createStatement();
                                        String qry2="select Nombre, Apellido, Telefono, Correo, Nombre_Usuario, Apartamento, Id_Usuario from usuario where Nombre_Usuario='" + usuario +"'";
                                        ResultSet data2 = sql2.executeQuery(qry2);
                                                while(data2.next()){
                                    %>
                                    <h4 class="mt-0 header-title">Casa Grande - Mi Información</h4><br>
                                    <div class="alert alert-danger" role="alert">
                                        <strong>¡Aviso!</strong> Características de un administrador.
                                    </div>
                                    <img src="Admi_Assets/images/small/img-13.jpg" class="img-fluid" alt="Responsive image" height="64"><br>
                                    <div class="pricing-features mt-4">
                                            <p class="m-b-0">Tener capacidad de liderazgo para el manejo de equipos de trabajo y tener criterio y ser estratega para la toma de decisiones
                                            son de las cualidades que un buen administrador debe tener para gozar de derechos y tener obligaciones que cumplir por su 
                                            rol de administrador en el conjunto.</p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Cargo: Administrador</p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Nombre: <% out.print(data2.getString(1));%> <% out.print(data2.getString(2));%></p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Correo: <% out.print(data2.getString(4));%></p>
                                            <p class="font-14 mb-2"><i class="ti-check-box text-success mr-3"></i>Teléfono: <% out.print(data2.getString(3));%></p>
                                    </div><br><% } %>
                                    <a href="PerfilAdministrador.jsp" class="btn btn-success btn-lg w-100 btn-round">Mi Perfil</a><br>
                                </div>
                            </div>
                            </div>
                            <div class="col-8">
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
                                        <h4 class="mt-0 header-title">Casa Grande - APARTAMENTOS</h4><br><br>
                                        
                                        <table class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>Apartamento</th>
                                                <th>Dueño Apartamento</th>
                                                <th>Cant Personas</th>
                                                <th>Cant Mascotas</th>
                                                <th>Teléfono</th>
                                                <th>Acción</th>
                                            </tr>
                                            </thead>
                                            <% 
                                        Connection conn3 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql3 = conn3.createStatement();
                                        String qry3="SELECT `Id_Apartamento`, `fecha`, `Apartamento`, `Dueño`, `Personas`, `Mascotas`, `Telefono` FROM `apartamentos` WHERE 1";
                                        ResultSet data3 = sql3.executeQuery(qry3);
                                                while(data3.next()){
                                    %>
                                            <tbody>
                                            <tr>
                                                <td><% out.print(data3.getString(3));%></td>
                                                <td><% out.print(data3.getString(4));%></td>
                                                <td><% out.print(data3.getString(5));%></td>
                                                <td><% out.print(data3.getString(6));%></td>
                                                <td><% out.print(data3.getString(7));%></td>
                                                <td>
                                                    <a type="button" class="btn btn-success btn-sm waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modal-center" href="ControladorApartamento?accion=editar&id=<% out.print(data3.getString(1));%>"><i class="fas fa-marker"></i></a>
                                                    <a type="button" class="btn btn-danger btn-sm waves-effect waves-light" href="ControladorApartamento?accion=eliminar&id=<% out.print(data3.getString(1));%>"><i class="fas fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title mt-0">Casa Grande - Editar Apartamento</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
                                    <% 
                                        Connection conn4 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql4 = conn4.createStatement();
                                        String qry4="SELECT `Id_Apartamento`, `fecha`, `Apartamento`, `Dueño`, `Personas`, `Mascotas`, `Telefono` FROM `apartamentos` WHERE Id_Apartamento = '" + data3.getString(1) +"'";
                                        ResultSet data4 = sql4.executeQuery(qry4);
                                                while(data4.next()){
                                    %>
                                     <form class="" action="ControladorApartamento">
                                
                             <div class="form-group">
                                <label>Numero de Apartamento</label>
                                <input type="text" name="txtApa" class="form-control" value="<% out.print(data4.getString(3));%>" readonly="readonly" />
                            </div> 
                                
                            <div class="form-group">
                                <label>Dueño Apartamento</label>
                                <input type="text" name="txtDue" class="form-control" value="<% out.print(data4.getString(4));%>"/>
                            </div>
                                
                            <div class="row">
                                <div class="col-lg-6">
                                    <label>Cantidad de Personas</label>
                                    <input type="text" name="txtPer" class="form-control" value="<% out.print(data4.getString(5));%>"/><br>
                                </div>
                                <div class="col-lg-6">
                                    <label>Cantidad de Mascotas</label>
                                    <input type="text" name="txtMas" class="form-control" required value="<% out.print(data4.getString(6));%>"/><br>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label>Teléfono</label>
                                <input type="text" name="txtTel" class="form-control" value="<% out.print(data4.getString(7));%>"/>
                            </div>
                            <br>
                            <div class="form-group">
                            <div>
                            <button type="submit" class="btn btn-primary waves-effect waves-light"><input type="hidden" name="txtid" value="<% out.print(data4.getString(1));%>"><input type="hidden" name="accion" value="Actualizar">Editar</button>
                            <button type="reset" class="btn btn-secondary waves-effect m-l-5" data-dismiss="modal" aria-label="Close">Cancelar</button>
                            </div>
                            </div>
                            </form> 
                                 </div>
                             </div><!-- /.modal-content -->
                         </div><!-- /.modal-dialog -->
                     </div>
                                            </tbody><% } %><% } %>
                                        </table>
        
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card m-b-30">
                                    <div class="card-body">
                                    <div class="faq-icon float-right">
                                        <div class="spinner-grow text-success" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-success" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-warning" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-warning" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-info" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                        <div class="spinner-grow text-info" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                    </div>
                                        <h4 class="mt-0 header-title">Casa Grande - Censo</h4>
                                        <p class="sub-title plugins">Información y generador de reportes del censo mensual del conjunto residencial casa grande
                                        </p>
        
                                        <table class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                
                                                <th>Mes</th>
                                                <th>Año</th>
                                                <th>Cant Personas</th>
                                                <th>Cant Niños</th>
                                                <th>Cant Adolecentes</th>
                                                <th>Cant Adultos</th>
                                                <th>Cant Ancianos</th>
                                                <th>Cant Mascotas</th>
                                                <th>Cant Vehículos</th>
                                                
                                            </tr>
                                            </thead>
                                            <% 
                                        Connection conn5 = 
                                            DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                                "root", "");
                                        Statement sql5 = conn5.createStatement();
                                        String qry5="SELECT `fecha`, `mes`, `AÑO`, `Personas`, `Niños`, `por_niñ`, `Adolecente`, `por_ado`, `Adultos`, `por_adu`, `AdultoMayor`, `por_may`, `Mascotas`, `vehiculo` FROM `censo` WHERE 1";
                                        ResultSet data5 = sql5.executeQuery(qry5);
                                                while(data5.next()){
                                    %>
                                            <tbody>
                                            <tr>
                                                <td><% out.print(data5.getString(2));%></td>
                                                <td><% out.print(data5.getString(3));%></td>
                                                <td><% out.print(data5.getString(4));%></td>
                                                <td><% out.print(data5.getString(5));%></td>
                                                <td><% out.print(data5.getString(7));%></td>
                                                <td><% out.print(data5.getString(9));%></td>
                                                <td><% out.print(data5.getString(11));%></td>
                                                <td><% out.print(data5.getString(13));%></td>
                                                <td><% out.print(data5.getString(14));%></td>
                                            </tr>
                                            <% } %>
                                            </tbody>
                                        </table>
        
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> 
                    </div></div>
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