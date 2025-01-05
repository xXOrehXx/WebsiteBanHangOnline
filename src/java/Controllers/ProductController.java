/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import dao.CartDAO;
import Models.Categories;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ProductDAO;
import Models.Products;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
        ProductDAO d = new ProductDAO();
        CartDAO c = new CartDAO();
        sess.setAttribute("cart", c.countNumOfProducts(String.valueOf(sess.getAttribute("login"))));
        if (sess.getAttribute("login") != null) {
            request.setAttribute("name", String.valueOf(sess.getAttribute("login")));
            request.setAttribute("NoP", String.valueOf(sess.getAttribute("cart")));
        } else {
            request.setAttribute("name", "Đăng nhập");
        }

        if (request.getParameter("search") != null) {
            if (request.getParameter("cat").equals("")) {
                sess.setAttribute("page", "product?search");
                sess.setAttribute("goto", "cart");
                String search = request.getParameter("searchstring");
                ArrayList<Categories> data = d.getOtherCategories("");
                ArrayList<Products> data1 = d.searchProduct(search);
                int count = data1.size();
                request.setAttribute("category", "Tìm kiếm");
                request.setAttribute("NoR", count);
                request.setAttribute("data", data);
                request.setAttribute("data1", data1);
                request.getRequestDispatcher("products.jsp").forward(request, response);
            } else {
                String search = request.getParameter("searchstring");
                String categoryid = request.getParameter("cat");
                sess.setAttribute("page", "product?catsearch");
                sess.setAttribute("goto", "cart");
                ArrayList<Categories> data = d.getOtherCategories(categoryid);
                ArrayList<Products> data1 = d.searchProductByCategories(search, categoryid);
                int count = data1.size();
                request.setAttribute("category", "Tìm kiếm");
                request.setAttribute("NoR", count);
                request.setAttribute("data", data);
                request.setAttribute("data1", data1);
                request.getRequestDispatcher("products.jsp").forward(request, response);
            }
        } else {
            if (request.getParameter("cat") != null) {
                sess.setAttribute("page", "product?cat");
                sess.setAttribute("goto", "product?cat=" + request.getParameter("cat"));
                String categoryid = request.getParameter("cat");
                ArrayList<Categories> data = d.getOtherCategories(categoryid);
                ArrayList<Products> data1 = d.getProductByCategories(categoryid);
                int count = data1.size();
                request.setAttribute("categoryid", categoryid);
                request.setAttribute("category", d.getCategory(categoryid));
                request.setAttribute("NoR", count);
                request.setAttribute("data", data);
                request.setAttribute("data1", data1);
                request.getRequestDispatcher("products.jsp").forward(request, response);
            } else {
                request.setAttribute("NoP", String.valueOf(sess.getAttribute("cart")));
                sess.setAttribute("page", "product?mod");
                sess.setAttribute("goto", "product?mod=" + request.getParameter("mod"));
                String id = request.getParameter("mod");
                Products p = d.getProductById(id);
                String category = d.getCategory(p.getCategory());
                ArrayList<Products> data = d.getRandomProducts();
                request.setAttribute("category", category);
                request.setAttribute("data1", data);
                request.setAttribute("p", p);
                request.getRequestDispatcher("product.jsp").forward(request, response);
            }
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
