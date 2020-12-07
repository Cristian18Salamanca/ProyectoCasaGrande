/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Vehiculo;
import ModeloDAO.VehiculoDAO;
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
@WebServlet(name = "ControladorVehiculoa", urlPatterns = {"/ControladorVehiculoa"})
public class ControladorVehiculoa extends HttpServlet {

    String listar="AVehiculo.jsp";
    String add="AVehiculo.jsp";
    String edit="AVehiculo.jsp";
    Vehiculo v=new Vehiculo();
    VehiculoDAO dao=new VehiculoDAO();
    int id, par;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorVehiculoa</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorVehiculoa at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            String pla=request.getParameter("txtPla");
            String apa=request.getParameter("txtApa");
            String due=request.getParameter("txtDue");
            String mar=request.getParameter("txtMar");
            String col=request.getParameter("txtCol");
            par=Integer.parseInt(request.getParameter("txtPar"));
            String est=request.getParameter("txtEst");
            v.setPla(pla);
            v.setApa(apa);
            v.setDue(due);
            v.setMar(mar);
            v.setCol(col);
            v.setPar(par);
            v.setEst(est);
            dao.add(v);
            acceso=add;
        }        
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            v.setId(id);
            dao.eliminar(id);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("salio")){
            id=Integer.parseInt(request.getParameter("id"));
            v.setId(id);
            dao.salio(id);
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("entro")){
            id=Integer.parseInt(request.getParameter("id"));
            v.setId(id);
            dao.entro(id);
            acceso=edit;
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
