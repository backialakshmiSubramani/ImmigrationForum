
package acc.project.capstone;

import java.io.IOException;
import java.util.List;
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
            request.setAttribute("flash", "Username and Password must be between 4 and 10 characters.");
            return "join";
        }
        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
            return "join";
        }
        
        User user = new User(username,password);
        user.setProfileid(new Profile());
        EntityManager em = getEM();
        try{
            em.getTransaction().begin();
            em.persist(user);
            em.merge(user);
            em.getTransaction().commit();
            request.getSession().setAttribute("user", user);
            return timeline(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "join";
        }
        
        
    }

    private String timeline(HttpServletRequest request) throws ServletException {
        
        
        return "timeline";
    }
    
    
    private String login(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) return "login";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EntityManager em = getEM();
        try {
            User user = (User)em.createNamedQuery("User.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            if (!user.getPassword().equals(password))
                throw new Exception("Access Denied");
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("userid",user.getId());
            return timeline(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "login";
        }
        
    }
    
    private String profile(HttpServletRequest request) throws ServletException {
        String username = request.getParameter("username");
        if (username == null) {
            request.setAttribute("flash", "Whose profile are you looking for?");
            return "profile";
        }
        EntityManager em = getEM();
        try {
            User user = (User)em.createNamedQuery("User.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();            
            Profile p = user.getProfileid();
            request.setAttribute("profileuser", user);
            return "profile";
        } catch (Exception sqle) {
            request.setAttribute("flash", sqle.getMessage());
            return "profile";
        }
    }
    
    private String logout(HttpServletRequest request) throws ServletException {
        request.getSession().removeAttribute("user");
        return timeline(request);
    }

    private EntityManager getEM() {
        EntityManagerFactory emf = (EntityManagerFactory)getServletContext().getAttribute("emf");
        return emf.createEntityManager();
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
