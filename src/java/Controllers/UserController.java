/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import dao.CartDAO;
import dao.UserDAO;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class UserController extends HttpServlet {

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
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
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
        String acc = request.getParameter("account");
        String pass = request.getParameter("password");
        String name = request.getParameter("name");
        String racc = request.getParameter("raccount");
        String rpass = request.getParameter("rpassword");
        String message = "";
        boolean check;
        HttpSession sess = request.getSession();
        CartDAO c = new CartDAO();
        sess.setAttribute("cart", c.countNumOfProducts(String.valueOf(sess.getAttribute("login"))));
        UserDAO d = new UserDAO();
        if (sess.getAttribute("login") != null) {
            Users u = d.getUsersByAccount(String.valueOf(sess.getAttribute("login")));
            if (u.getGender().equals("1")) {
                request.setAttribute("male", "checked=\"checked\"");
            } else if (u.getGender().equals("false")) {
                request.setAttribute("0", "checked=\"checked\"");
            } else {
                //do nothing
            }
            if (d.checkAdmin(String.valueOf(sess.getAttribute("login"))) == true) {
                request.setAttribute("link", "Admin nhấn vào đây");
            }
            request.setAttribute("NoP", sess.getAttribute("cart"));
            request.setAttribute("name", String.valueOf(sess.getAttribute("login")));
            request.setAttribute("u", u);
            request.getRequestDispatcher("account.jsp").forward(request, response);
            return;
        } else {
            if (request.getParameter("login") != null) {
                check = d.checkUser(acc, pass);
                if (check == true) {
                    sess.setAttribute("login", acc);
                    sess.setAttribute("page", "user");
                    request.getRequestDispatcher("home").forward(request, response);
                    return;
                } else {
                    message = "Đăng nhập thất bại, kiểm tra lại tài khoản và mật khẩu";
                }
            }
            if (request.getParameter("register") != null) {
                message = d.insertUser(racc, rpass, name);
            }
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String acc = request.getParameter("account");
        String pass = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String message = "";
        UserDAO d = new UserDAO();
        if (request.getParameter("update") != null) {
            message = d.updateUser(acc, pass, name, gender, address, phone, dob);
        }
        Users u = d.getUsersByAccount(String.valueOf(sess.getAttribute("login")));
        if (request.getParameter("logout") != null) {
            sess.setAttribute("login", null);
            response.sendRedirect("home");
            return;
        }
        if (u.getGender().equals("true")) {
            request.setAttribute("male", "checked=\"checked\"");
        } else if (u.getGender().equals("false")) {
            request.setAttribute("female", "checked=\"checked\"");
        }
        request.setAttribute("NoP", sess.getAttribute("cart"));
        request.setAttribute("name", String.valueOf(sess.getAttribute("login")));
        request.setAttribute("u", u);
        request.setAttribute("message", message);
        request.getRequestDispatcher("account.jsp").forward(request, response);
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
