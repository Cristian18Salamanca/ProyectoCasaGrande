<%@page import="java.util.Iterator"%>
<%@page import="Modelo.ResidenteInha"%>
<%@page import="Modelo.PersonaInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ResidenteInhaDAO"%>
<%@page import="ModeloDAO.PersonaInhaDAO"%>
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
                                        <img src="Admi_Assets/images/users/user-4.jpg" alt="user" class="rounded-circle"><span class="ml-1 pro-user-name">${user}<i class="mdi mdi-chevron-down"></i> </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                        <!-- item-->
                                        <a class="dropdown-item" href="PerfilAdministrador.jsp"><i class="mdi mdi-account-circle"></i>Perfil</a>
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
                                                
                        <li class="menu-title">Menú - Inhabilitados</li>
                        <li>
                            <a href="InhaApartamentos.jsp" class="waves-effect">
                                <i class="fas fa-users"></i><span>Apartamentos Inhabilitados</span>
                            </a>
                        </li>
                        <li>
                            <a href="InhaPersonas.jsp" class="waves-effect">
                                <i class="fas fa-users"></i><span>Personas Inhabilitadas</span>
                            </a>
                        </li>
                        <li>
                            <a href="InhaQuejas.jsp" class="waves-effect">
                                <i class="fas fa-users"></i><span>Reclamos Inhabilitados</span>
                            </a>
                        </li>
                        <li>
                            <a href="InhaResidente.jsp" class="waves-effect">
                                <i class="fas fa-users"></i><span>Residentes Inhabilitados</span>
                            </a>
                        </li>
                        <li>
                            <a href="InhaVehiculo.jsp" class="waves-effect">
                                <i class="fas fa-users"></i><span>Vehículos Inhabilitados</span>
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
                                <h4 class="page-title">Conjunto Residencial Casa Grande - Configuración detallada del Apartamento</h4>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item"><a href="javascript:void(0);">Casa Grande</a></li>
                                    <li class="breadcrumb-item active">Cfg. Apartamento</li>
                                </ol>
                            </div>
                            </div> <!-- end row -->
                        </div>
                        <!-- end page-title -->
                         <div class="row">
                            <!-- end col -->
                            <div class="col-lg-12">
                                <div class="card m-b-30">
                                    <div class="card-body">
                                        <h4 class="mt-0 header-title">CASA GRANDE - RESIDENTE</h4><br>
                                        <p class="sub-title">Información sobre cada uno de los apartamentos de nuestro conjunto residencial <code>Casa Grande</code>.
                                        </p>
                                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Apartamento</th>
                                                <th>Inicio de Contrato</th>
                                                <th>Fin del Contrato</th>
                                                <th>Tipo de Residente</th>
                                                <th>Arrendado A</th>
                                                <th>Vehículo</th>
                                                <th>Acción</th>
                                            </tr>
                                            </thead>
                                            <%
                    ResidenteInhaDAO dao=new ResidenteInhaDAO();
                    List<ResidenteInha>list=dao.listar();
                    Iterator<ResidenteInha>iter=list.iterator();
                    ResidenteInha rin=null;
                    while(iter.hasNext()){
                        rin=iter.next();
                    
                %>
                                            <tbody>
                                            <tr>
                                                <td><%= rin.getId()%></td>
                                                <td><%= rin.getApa()%></td>
                                                <td><%= rin.getIcon()%></td>
                                                <td><%= rin.getFcon()%></td>
                                                <td><%= rin.getTip()%></td>
                                                <td><%= rin.getArre()%></td>
                                                <td><%= rin.getVeh()%></td>
                                                <td>
                                                    <button type="button" class="btn btn-success btn-sm waves-effect waves-light"><a href="ControladorResidenteInha?accion=eliminar&id=<%= rin.getId()%>">Recuperar</a></button> 
                                                </td>
                                            </tr>
                                            <%}%>
                                            </tbody>
                                        </table>                                               
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>
                    </div>
                    <!-- container-fluid -->

                </div>
                <!-- content -->

            </div>
            <!-- content -->

            <footer class="footer">
                2020 © Casa Grande. - Estamos formando la mejor comunidad para vivir<span class="d-none d-sm-inline-block"></span>.<i class="mdi mdi-heart text-danger"></i>
            </footer>

        </div>
        <!-- ============================================================== -->
        <!-- End Right content here -->
        <!-- ============================================================== -->

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
