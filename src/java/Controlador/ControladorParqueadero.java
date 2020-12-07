/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Parqueadero;
import ModeloDAO.ParqueaderoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorParqueadero", urlPatterns = {"/ControladorParqueadero"})
public class ControladorParqueadero extends HttpServlet {
    
    String listar="Vigilante.jsp";
    String add="Vigilante.jsp";
    String edit="Vigilante.jsp";
    Parqueadero p=new Parqueadero();
    ParqueaderoDAO dao=new ParqueaderoDAO();
    int id, num;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorParqueadero</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorParqueadero at " + request.getContextPath() + "</h1>");
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
            num=Integer.parseInt(request.getParameter("txtNum"));
            String apa=request.getParameter("txtApa");
            String due=request.getParameter("txtDue");
            String dis=request.getParameter("txtDis");
            p.setNum(num);
            p.setApa(apa);
            p.setDue(due);
            p.setDis(dis);
            dao.add(p);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idpar",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            num=Integer.parseInt(request.getParameter("txtNum"));
            String apa=request.getParameter("txtApa");
            String due=request.getParameter("txtDue");
            String dis=request.getParameter("txtDis");
            p.setId(id);
            p.setNum(num);
            p.setApa(apa);
            p.setDue(due);
            p.setDis(dis);
            dao.edit(p);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("mantenimiento")){
            id=Integer.parseInt(request.getParameter("id"));
            p.setId(id);
            dao.mantenimiento(id);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("ocupado")){
            id=Integer.parseInt(request.getParameter("id"));
            p.setId(id);
            dao.ocupado(id);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
