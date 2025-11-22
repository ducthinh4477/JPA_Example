package vn.iotstar.controller.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.entity.CategoryEntity;
import vn.iotstar.entity.UserEntity;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.impl.CategoryService;
import vn.iotstar.utils.Constant;

@WebServlet(urlPatterns = "/user/home")
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ICategoryService cateService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute(Constant.SESSION_LOGIN) == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        UserEntity user = (UserEntity) session.getAttribute(Constant.SESSION_LOGIN);

        if (user.getRoleid() != 1) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        List<CategoryEntity> list = cateService.findAll();

        req.setAttribute("listcate", list);
        req.setAttribute("username", user.getUsername());

        req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
    }
}
