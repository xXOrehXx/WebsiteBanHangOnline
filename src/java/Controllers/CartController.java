/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import dao.CartDAO;
import Models.CartProducts;
import dao.ProductDAO;
import Models.Products;
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
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        sess.setAttribute("page", "cart");
        if (sess.getAttribute("login") != null) {
            CartDAO c = new CartDAO();
            sess.setAttribute("cart", c.countNumOfProducts(String.valueOf(sess.getAttribute("login"))));
            if (request.getParameter("mod") != null) {
                String productid = request.getParameter("mod");
                c.deleteCartProducts(String.valueOf(sess.getAttribute("login")), productid);
                sess.setAttribute("cart", c.countNumOfProducts(String.valueOf(sess.getAttribute("login"))));
            }
            ArrayList<CartProducts> data = c.getCartProduct(String.valueOf(sess.getAttribute("login")));
            ProductDAO p = new ProductDAO();
            ArrayList<Products> data1 = p.getRandomProducts();
            request.setAttribute("NoP", sess.getAttribute("cart"));
            request.setAttribute("name", String.valueOf(sess.getAttribute("login")));
            request.setAttribute("totalcost", c.getTotalCost(String.valueOf(sess.getAttribute("login"))));
            request.setAttribute("data", data);
            request.setAttribute("data1", data1);
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        } else {
            response.sendRedirect("User");
        }
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
        HttpSession sess = request.getSession();
        String productid = "";
        String amount;
        CartDAO c = new CartDAO();
        String user = String.valueOf(sess.getAttribute("login"));
        if (request.getParameter("addcart") != null) {
            if (sess.getAttribute("login") != null) {
                productid = request.getParameter("addcart");
                c.updateCart(user, productid, String.valueOf(c.getAmount(user, productid) + 1));
                if (sess.getAttribute("page").equals("home")) {
                    response.sendRedirect("home");
                } else if (sess.getAttribute("page").equals("cart")) {
                    response.sendRedirect("cart");
                } else if (sess.getAttribute("page").equals("product?mod")) {
                    response.sendRedirect(String.valueOf(sess.getAttribute("goto")));
                } else if (sess.getAttribute("page").equals("product?cat")) {
                    response.sendRedirect(String.valueOf(sess.getAttribute("goto")));
                } else if (sess.getAttribute("page").equals("product?search")) {
                    response.sendRedirect(String.valueOf(sess.getAttribute("goto")));
                } else if (sess.getAttribute("page").equals("product?catsearch")) {
                    response.sendRedirect(String.valueOf(sess.getAttribute("goto")));
                }
            } else {
                response.sendRedirect("User");
            }
        } else {
            productid = request.getParameter("id");
            if (request.getParameter("submit").equals("")) {
                amount = "1";
            } else {
                amount = request.getParameter("submit");
            }
            c.updateAmount(user, productid, amount);
            response.sendRedirect("cart");
        }
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
