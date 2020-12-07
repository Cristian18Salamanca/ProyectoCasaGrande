/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Visitante;
import ModeloDAO.VisitanteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author crist
 */
@WebServlet(name = "ControladorVisitante", urlPatterns = {"/ControladorVisitante"})
public class ControladorVisitante extends HttpServlet {

    String listar="Vigilante.jsp";
    String add="Vigilante.jsp";
    String edit="vistas/editVisitante.jsp";
    Visitante v=new Visitante();
    VisitanteDAO vdao=new VisitanteDAO();
    int id, par;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorVisitante</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorVisitante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;            
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String nom=request.getParameter("txtNom");
            String veh=request.getParameter("txtVeh");
            String pla=request.getParameter("txtPla");
            String apa=request.getParameter("txtApa");
            String fec=request.getParameter("txtFec");
            String hen=request.getParameter("txtHen");
            par=Integer.parseInt(request.getParameter("txtPar"));
            v.setNom(nom);
            v.setVeh(veh);
            v.setPla(pla);
            v.setApa(apa);
            v.setFec(fec);
            v.setHen(hen);
            v.setPar(par);
            vdao.add(v);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idvis",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String nom=request.getParameter("txtNom");
            String veh=request.getParameter("txtVeh");
            String pla=request.getParameter("txtPla");
            String apa=request.getParameter("txtApa");
            String fec=request.getParameter("txtFec");
            String hen=request.getParameter("txtHen");
            String hsa=request.getParameter("txtHsa");
            v.setId(id);
            v.setNom(nom);
            v.setVeh(veh);
            v.setPla(pla);
            v.setApa(apa);
            v.setFec(fec);
            v.setHen(hen);
            v.setHsa(hsa);
            vdao.edit(v);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("terminado")){
            par=Integer.parseInt(request.getParameter("par"));
            v.setPar(par);
            vdao.terminado(par);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("multado")){
            id=Integer.parseInt(request.getParameter("id"));
            v.setId(id);
            vdao.multado(id);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
