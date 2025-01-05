/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import dao.CartDAO;
import Models.HomeProducts;
import dao.ProductDAO;
import Models.Products;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class PageController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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
        HttpSession sess = request.getSession();
        CartDAO c = new CartDAO();
        UserDAO u = new UserDAO();
        sess.setAttribute("page", "home");
        String delete = "";
        ProductDAO d = new ProductDAO();
        if (sess.getAttribute("login") == null) {
            ArrayList<HomeProducts> data = d.getHomeProducts();
            request.setAttribute("name", "Đăng nhập");
            request.setAttribute("data", data);
        } else {
            ArrayList<HomeProducts> data = d.getHomeProductsUsers(String.valueOf(sess.getAttribute("login")));
            sess.setAttribute("cart", c.countNumOfProducts(String.valueOf(sess.getAttribute("login"))));
            if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
                c.deleteCart(String.valueOf(sess.getAttribute("login")));
                sess.setAttribute("cart", c.countNumOfProducts(String.valueOf(sess.getAttribute("login"))));
            }
            if (u.checkAdmin(String.valueOf(String.valueOf(sess.getAttribute("login"))))) {
                delete = "Xóa";
            }
            request.setAttribute("data", data);
            request.setAttribute("delete", delete);
            request.setAttribute("name", String.valueOf(sess.getAttribute("login")));
            request.setAttribute("NoP", sess.getAttribute("cart"));
        }

        request.getRequestDispatcher("home.jsp").forward(request, response);
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
