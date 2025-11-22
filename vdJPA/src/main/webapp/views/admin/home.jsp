<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: #f4f4f4;
    }

    /* TOP NAVIGATION */
    .navbar {
        background: #D32F2F;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
        position: sticky;
        top: 0;
        z-index: 999;
        box-shadow: 0 3px 10px rgba(0,0,0,0.2);
    }

    .nav-left {
        display: flex;
        align-items: center;
        gap: 20px;
        font-size: 20px;
        font-weight: bold;
    }

    .nav-buttons a {
        margin-left: 20px;
        padding: 10px 18px;
        background: white;
        color: #D32F2F;
        font-weight: bold;
        border-radius: 8px;
        text-decoration: none;
        transition: 0.2s;
    }

    .nav-buttons a:hover {
        background: #ffcdd2;
    }

    /* MAIN CONTENT */
    .container {
        padding: 30px;
    }

    .welcome-box {
        background: #ef5350;
        color: white;
        border-radius: 20px;
        padding: 35px;
        font-size: 22px;
        box-shadow: 0 5px 25px rgba(0,0,0,0.15);
    }

    /* USER TABLE */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 30px;
        background: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 3px 12px rgba(0,0,0,0.1);
    }

    th {
        background: #EF9A9A;
        padding: 15px;
        color: #333;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #eee;
    }

    .action-btn {
        padding: 7px 15px;
        border-radius: 8px;
        color: white;
        text-decoration: none;
        margin-right: 5px;
        font-size: 14px;
    }

    .edit-btn { background: #0288d1; }
    .delete-btn { background: #d32f2f; }

    .add-btn {
        display: inline-block;
        margin-top: 20px;
        background: #C62828;
        color: white;
        padding: 12px 20px;
        border-radius: 10px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.2s;
    }

    .add-btn:hover {
        background: #8e0000;
    }
</style>
</head>

<body>

<!-- TOP NAV -->
<div class="navbar">
    <div class="nav-left">
        🔧 Admin Dashboard
    </div>

    <div class="nav-buttons">
        <a href="#">Quản lý loại hàng</a>
        <a href="#">Quản lý sản phẩm</a>
        <a href="#">Báo cáo thống kê</a>
        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
    </div>
</div>

<div class="container">

    <!-- WELCOME BOX -->
    <div class="welcome-box">
        Xin chào, <b>${sessionScope.account.fullname}</b> 👋  
        <br>Chúc bạn một ngày tốt lành!
    </div>


    <!-- USER MANAGEMENT -->
    <h2 style="margin-top: 40px;">👤 Danh sách người dùng</h2>

    <a class="add-btn" href="${pageContext.request.contextPath}/admin/user/add">+ Thêm người dùng</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Họ tên</th>
            <th>Email</th>
            <th>Username</th>
            <th>Vai trò</th>
            <th>Hành động</th>
        </tr>

        <c:forEach var="u" items="${userList}">
            <tr>
                <td>${u.id}</td>
                <td>${u.fullname}</td>
                <td>${u.email}</td>
                <td>${u.username}</td>
                <td>${u.roleid == 1 ? "Admin" : "User"}</td>
                <td>
                    <a class="action-btn edit-btn" href="${pageContext.request.contextPath}/admin/user/edit?id=${u.id}">Sửa</a>
                    <a class="action-btn delete-btn" href="${pageContext.request.contextPath}/admin/user/delete?id=${u.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!-- CATEGORY MANAGEMENT -->
		<h2 style="margin-top: 50px;">📦 Danh mục sản phẩm</h2>
		
		<a class="add-btn" href="${pageContext.request.contextPath}/admin/category/add">+ Thêm danh mục</a>
		
		<table>
		    <tr>
		        <th>ID</th>
		        <th>Tên danh mục</th>
		        <th>Biểu tượng</th>
		        <th>Người tạo</th>
		        <th>Hành động</th>
		    </tr>
		
		    <c:forEach var="c" items="${listcate}">
		        <tr>
		            <td>${c.cateId}</td>
		            <td>${c.cateName}</td>
		            <td>${c.icons}</td>
		            <td>${c.user.fullname}</td> <!-- nếu muốn show người tạo -->
		            
		            <td>
		                <a class="action-btn edit-btn"
		                   href="${pageContext.request.contextPath}/admin/category/edit?id=${c.cateId}">
		                    Sửa
		                </a>
		
		                <a class="action-btn delete-btn"
		                   href="${pageContext.request.contextPath}/admin/category/delete?id=${c.cateId}">
		                    Xóa
		                </a>
		            </td>
		        </tr>
		    </c:forEach>
		</table>

    

</div>

</body>
</html>
