package acc.project.capstone;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

@WebServlet(name="Controller", urlPatterns={"/eindex"})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "index";
        String destination;
        switch (action) {
            default:
            case "index":
                destination = index(request);
                break;
            case "signup":
                destination = signup(request);
                break;
            case "post":
                destination = post(request);
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
          /*  case "pedit":
                destination = editProfile(request);
                break;
            case "upload":
                destination = uploadImage(request);
                break;
            case "image":
                image(request, response);
                return;
            case "wall":
                destination = wall(request);*/
        }
        request.getRequestDispatcher(destination + ".jsp").forward(request, response);
    }

    private String signup(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) return "signup";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 =request.getParameter("password2");
        if (username.length() < 4 || username.length() > 10
                || password.length() < 4 || password.length() > 10) {
            request.setAttribute("flash", "Username must be between 4 and 10 characters.");
            return "signup";
        }
        if (!password.equals(password2)) {
            request.setAttribute("flash", "Passwords don't match.");
           return "signup";
        }
        Users user = new Users(username,password);
        user.setProfileid(new Profiles());
        EntityManager em = getEM();
        try{
            em.getTransaction().begin();
            em.persist(user);
            em.merge(user);
            em.getTransaction().commit();
            request.getSession().setAttribute("user", user);
            return index(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "signup";
        }
    }

    private String index(HttpServletRequest request) throws ServletException {
        EntityManager em = getEM();
        try {
            List<Posts> posts = em.createNamedQuery("Post.findAll").getResultList();
            request.setAttribute("posts", posts);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
        }
        System.out.println("Successfully logged in");
        return "index";
    }
    
   

    private String post(HttpServletRequest request) throws ServletException {
        Users user = (Users)request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("flash", "You are not logged in!");
            return "signup";
        }
        if (request.getMethod().equals("GET")) return "post";
        String content = request.getParameter("content");
        if (content.length() < 1 || content.length() > 140) {
            request.setAttribute("flash", "Content must be between 1 and 140 characters.");
            return "post";
        }
        Posts post = new Posts();
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
        return index(request);
    }

    private String login(HttpServletRequest request) throws ServletException {
        if (request.getMethod().equals("GET")) return "login";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EntityManager em = getEM();
        try {
            Users user = (Users)em.createNamedQuery("User.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            if (!user.getPassword().equals(password))
                throw new Exception("Access Denied");
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("userid",user.getId());
            return index(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "login";
        }
    }

    private String logout(HttpServletRequest request) throws ServletException {
        request.getSession().removeAttribute("user");
        return index(request);
    }

    private String profile(HttpServletRequest request) throws ServletException {
        String username = request.getParameter("username");
        if (username == null) {
            request.setAttribute("flash", "Whose profile are you looking for?");
            return "profile";
        }
        EntityManager em = getEM();
        try {
            Users user = (Users)em.createNamedQuery("User.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();            
            Profiles p = user.getProfileid();
            request.setAttribute("profileuser", user);
            return "profile";
        } catch (Exception sqle) {
            request.setAttribute("flash", sqle.getMessage());
            return "profile";
        }
    }

    private String editProfile(HttpServletRequest request)
            throws ServletException {
        Users user = (Users)request.getSession().getAttribute("user");
        if (request.getMethod().equals("GET")) {
            request.setAttribute("user",user);
            return "profile_only_edit";
        }
        String bio = request.getParameter("biography");
        String email = request.getParameter("email");
        Profiles p = user.getProfileid();
        p.setBiography(bio);
        p.setEmail(email);
        EntityManager em = getEM();
        try {
            em.getTransaction().begin();
            em.merge(p);
            em.getTransaction().commit();
            return profile(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "profile_only_edit";
        }
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
