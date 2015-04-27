
package acc.project.capstone;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bhagya
 */
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "timeline";
        String destination;
        switch (action) {
            default:
            case "timeline":
                destination = timeline(request);
                break;
            case "join":
                destination = join(request);
                break;
            
            case "login":
                destination = login(request);
                break;
            
        }
        request.getRequestDispatcher(destination + ".jsp").forward(request, response);
    }

    private String join(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) return "join";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 =request.getParameter("password2");
        if (username.length() < 4 || username.length() > 10
                || password.length() < 4 || password.length() > 10) {
            request.setAttribute("flash", "Username must be between 4 and 10 characters.");
            return "join";
        }
        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
            return "join";
        }
        return "join";
        
    }

    private String timeline(HttpServletRequest request) throws ServletException {
        
        return "timeline";
    }
    
    
    private String login(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) return "login";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        return "login";
        
    }

    
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
