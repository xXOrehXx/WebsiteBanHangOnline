/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Categories;
import dao.CategoryDAO;
import dao.ProductDAO;
import Models.Products;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class AdminProductController extends HttpServlet {

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
            out.println("<title>Servlet AdminProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProductController at " + request.getContextPath() + "</h1>");
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
        if (sess.getAttribute("login") != null) {
            ProductDAO d = new ProductDAO();
            UserDAO u = new UserDAO();
            CategoryDAO ct = new CategoryDAO();
            ArrayList<Categories> data1 = ct.getCategories();
            if (u.checkAdmin(String.valueOf(sess.getAttribute("login")))) {
                if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
                    d.deleteProduct(request.getParameter("id"));
                }
                if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
                    d.getProductById(request.getParameter("id"));
                    request.setAttribute("p", d);
                    request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                }
                ArrayList<Products> data = d.searchProduct("");
                request.setAttribute("data1", data1);
                request.setAttribute("data", data);
                request.getRequestDispatcher("ListProduct.jsp").forward(request, response);

            } else {
                response.sendRedirect("Error.jsp");
            }
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
        if (sess.getAttribute("login") != null) {
            ProductDAO d = new ProductDAO();
            UserDAO u = new UserDAO();
            CategoryDAO ct = new CategoryDAO();
            ArrayList<Categories> data1 = ct.getCategories();
            if (u.checkAdmin(String.valueOf(sess.getAttribute("login")))) {
                if (request.getParameter("add") != null) {
                    String name = request.getParameter("name");
                    String price = request.getParameter("price");
                    String description = request.getParameter("description");
                    String category = request.getParameter("category");
                    String image = "";
                    Part part = request.getPart("image");

                    if (part == null) {
                        image = "Image\\placeholder.png";
                    } else {
                        String tempPath = request.getServletContext().getRealPath("/temp");
                        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
                        part.write(tempPath + "\\" + filename);
                        Path source = Paths.get(tempPath + "\\" + filename);
                        String realPath = request.getServletContext().getRealPath("/Image");
                        String fullpath = realPath + "\\" + filename;
                        image = "Image\\" + filename;
                        System.out.println(tempPath);
                        System.out.println(fullpath);
                        Files.copy(source, source.resolveSibling(fullpath), REPLACE_EXISTING);
                    }

                    d.addProduct(name, price, image, description, category);
                }
                if (request.getParameter("search") != null) {
                    ArrayList<Products> data = d.searchProduct(request.getParameter("name"));
                    request.setAttribute("data1", data1);
                    request.setAttribute("data", data);
                    request.getRequestDispatcher("ListProduct.jsp").forward(request, response);
                } else {
                    ArrayList<Products> data = d.searchProduct("");
                    request.setAttribute("data1", data1);
                    request.setAttribute("data", data);
                    request.getRequestDispatcher("ListProduct.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("Error.jsp");
            }
        } else {
            response.sendRedirect("User");
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
