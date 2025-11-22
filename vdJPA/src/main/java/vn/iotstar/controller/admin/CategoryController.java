package vn.iotstar.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.iotstar.entity.CategoryEntity;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.impl.CategoryService;

@WebServlet(urlPatterns = "/admin/categories")
public class CategoryController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ICategoryService cateService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<CategoryEntity> list = cateService.findAll();
        req.setAttribute("listcate", list);

        req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
    }
}
