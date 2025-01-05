/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import dao.UserDAO;
import Models.Users;
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
public class AdminUserController extends HttpServlet {

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
            out.println("<title>Servlet AdminUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUserController at " + request.getContextPath() + "</h1>");
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
        UserDAO u = new UserDAO();
        if (sess.getAttribute("login") != null) {
            if (u.checkAdmin(String.valueOf(sess.getAttribute("login")))) {
                if (request.getParameter("add") != null) {
                    String account = request.getParameter("account");
                    String password = request.getParameter("password");
                    String name = request.getParameter("name");
                    String gender = request.getParameter("gender");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String dob = request.getParameter("dob");
                    String group = request.getParameter("group");
                    u.insertUserAsAdmin(account, password, name, gender, address, phone, dob, group);
                }

                if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
                    u.deleteUser(String.valueOf(request.getParameter("acc")));
                }
                if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
                    Users p = u.getUsersByAccount(String.valueOf(request.getParameter("acc")));
                    if (p.getGender().equals("male")) {
                        request.setAttribute("male", "checked=\"\"");
                    } else {
                        request.setAttribute("female", "checked=\"\"");
                    }
                    request.setAttribute("acc", String.valueOf(request.getParameter("acc")));
                    request.setAttribute("p", p);
                    request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
                }
                if (request.getParameter("update") != null) {
                    String account = request.getParameter("account");
                    String password = request.getParameter("password");
                    String name = request.getParameter("name");
                    String gender = request.getParameter("gender");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String dob = request.getParameter("dob");
                    String group = request.getParameter("group");
                    String acc = request.getParameter("acc");
                    u.updateUserAsAdmin(account, password, name, gender, address, phone, dob, group, acc);
                }
                ArrayList<Users> data = u.getUsers();
                request.setAttribute("data", data);
                request.getRequestDispatcher("ListUser.jsp").forward(request, response);
                return;
            } else {
                request.getRequestDispatcher("Error.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("User");
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
