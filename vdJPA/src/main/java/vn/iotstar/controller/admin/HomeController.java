package vn.iotstar.controller.admin;

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
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserService;

@WebServlet(urlPatterns = "/admin/home")
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ICategoryService cateService = new CategoryService();
    IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession ses = req.getSession(false);
        if (ses == null || ses.getAttribute(Constant.SESSION_LOGIN) == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        UserEntity user = (UserEntity) ses.getAttribute(Constant.SESSION_LOGIN);

        // Kiểm tra quyền admin
        if (user.getRoleid() != 3) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        // Load Category (nếu bạn cần)
        List<CategoryEntity> cateList = cateService.findAll();
        req.setAttribute("listcate", cateList);

        // Load toàn bộ User cho trang admin
        List<UserEntity> userList = userService.findAll();
        req.setAttribute("userList", userList);

        req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
    }
}
