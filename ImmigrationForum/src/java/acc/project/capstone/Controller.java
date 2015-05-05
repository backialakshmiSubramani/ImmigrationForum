package acc.project.capstone;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
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
        if (action == null) {
            action = "timeline";
        }
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
            case "logout":
                destination = logout(request);
                break;
            case "profile":
                destination = profile(request);
                break;
            case "post":
                destination = post(request);
                break;
         /*   case "allPost":
                destination = allPost(request, response);
                break;*/
        }
        request.getRequestDispatcher(destination + ".jsp").forward(request, response);
    }

    private String join(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) {
            return "join";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        if (username.length() < 4 || username.length() > 10
                || password.length() < 4 || password.length() > 10) {
            request.setAttribute("flash", "Username and Password must be between 4 and 10 characters.");
            return "join";
        }
        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
            return "join";
        }

        User user = new User(username, password);
        user.setProfileid(new Profile());
        EntityManager em = getEM();
        try {
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
        EntityManager em = getEM();
        try {
            List<Post> posts = em.createNamedQuery("Post.findAll").getResultList();
            request.setAttribute("posts", posts);

        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
        }
        return "timeline";
    }

    private String login(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) {
            return "login";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EntityManager em = getEM();
        try {
            User user = (User) em.createNamedQuery("User.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            if (!user.getPassword().equals(password)) {
                throw new Exception("Access Denied");
            }
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("userid", user.getId());
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
            User user = (User) em.createNamedQuery("User.findByUsername")
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

 /*   private String allPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("ImmigrationForumPU");
            EntityManager em = emf.createEntityManager();
            Query q = em.createNamedQuery("Post.findAll");
            List<Post> post = q.getResultList();
            request.setAttribute("AllPosts", post);
            request.getRequestDispatcher("post.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            request.getRequestDispatcher("post1.jsp").forward(request, response);
        }
        return "timeline";
    }
*/
    private String post(HttpServletRequest request) throws ServletException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("flash", "You are not logged in!");
            return "join";
        }
        if (request.getMethod().equals("GET")) {
            return "post";
        }
        String content = request.getParameter("content");
        if (content.length() < 1 || content.length() > 140) {
            request.setAttribute("flash", "Content must be between 1 and 140 characters.");
            return "post";
        }
        Post post = new Post();
        post.setContent(content);
        post.setAuthorid(user);
        EntityManager em = getEM();
        try {
            em.getTransaction().begin();
            em.persist(post);
            em.merge(post);
            em.getTransaction().commit();
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "post";
        }
        return timeline(request);
    }

    private String logout(HttpServletRequest request) throws ServletException {
        request.getSession().removeAttribute("user");
        return timeline(request);
    }

    private EntityManager getEM() {
        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
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
