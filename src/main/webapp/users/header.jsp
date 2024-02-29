<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/theme/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/users/list">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/users/list">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>


                    <!-- Nav Item - User Information -->
                </ul>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <%--                    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>--%>
                    <ul class="user-list">
                        <c:forEach var="user" items="${users}">
                            <li>
                                <span class="user-property">Username:</span>
                                <span class="user-value">${user.userName}</span>
                            </li>
                            <li>
                                <span class="user-property">Email:</span>
                                <span class="user-value">${user.email}</span>
                            </li>
                            <li>
                                <span class="user-property">Password:</span>
                                <span class="user-value">*****</span>
                            </li>

                            <span class="user-property">Actions:</span>
                            <br>
                            <span class="user-value">
<!-- Tworzymy link "Delete" z wywołaniem funkcji JavaScript -->
<a href="#" onclick="confirmDelete(${user.id})">Delete</a>

<script>
    // Funkcja JavaScript do potwierdzenia usunięcia użytkownika
    function confirmDelete(userId) {
        // Wyświetlamy okno dialogowe z pytaniem o potwierdzenie
        if (confirm('Czy na pewno chcesz usunąć użytkownika o ID ' + userId + '?')) {
            // Jeśli użytkownik potwierdzi, przekierowujemy go na stronę usuwania użytkownika
            window.location.href = '/users/deleteUser?id=' + userId;
        }
    }
</script>

                                <!-- Tworzymy link "Edit" z wywołaniem funkcji JavaScript -->
<a href="#" onclick="editUser(${user.id})">Edit</a>

<script>
    // Funkcja JavaScript do edycji użytkownika
    function editUser(userId) {
        // Przekierowanie użytkownika na stronę edycji z odpowiednim ID użytkownika w adresie URL
        window.location.href = '/users/updateUser?id=' + userId;
    }
</script>
                                <a href="#" onclick="showUser(${user.id})">Show</a>
                                <script>
    // Funkcja JavaScript do edycji użytkownika
    function showUser(userId) {
        // Przekierowanie użytkownika na stronę edycji z odpowiednim ID użytkownika w adresie URL
        window.location.href = '/users/showDetails?id=' + userId;
    }
</script>
                             </span>
                            <br>

                            <br>
                        </c:forEach>
                    </ul>
                    <a href="/users/createUser" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Create new User</a>
                </div>




                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

</div>

</body>

</html>
