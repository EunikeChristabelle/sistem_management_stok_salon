<?php
    session_start();
    if( isset($_SESSION["login"])) {
        header("Location: dashboard.php");
        exit;
    }

    require 'functions.php';

    if( isset($_POST["login"])) {
        $username = $_POST["username"];
        $password = $_POST["password"];

        $result = mysqli_query($conn, "SELECT * FROM tb_account WHERE username = '$username'");
        // cek username
        if(mysqli_num_rows($result) === 1) {
            // cek password
            $row = mysqli_fetch_assoc($result);
            if(password_verify($password, $row["password"])) {
                // set session
                $_SESSION["login"] = true;
                $_SESSION['username'] = $username;

                header("Location: dashboard.php");
                exit;
            } else {
                $error = true;
            }
        } else {
            $error = true;
        }
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
    <style>
    body {
        background: url('assets/images/bg/bglogin.jpg') no-repeat center center fixed;
        background-size: cover;
        backdrop-filter: blur(5px);
    }

    .auth-container {
        background: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(5px);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }
    </style>
</head>

<body>
    <div id="auth" class="d-flex justify-content-center align-items-center vh-100">
        <div class="row justify-content-center w-100">
            <div class="col-lg-4 col-md-6 col-sm-8">
                <div id="auth-left" class="p-3 auth-container">
                    <h1 class="auth-title text-center">Log in</h1>
                    <p class="auth-subtitle text-center mb-4">Register to admin and login with your data.</p>
                    <?php if(isset($error) ):?>
                    <p class="text-danger text-center">Username atau Password salah</p>
                    <?php endif; ?>
                    <form action="" method="post">
                        <div class="form-group position-relative has-icon-left mb-3">
                            <input type="text" class="form-control form-control-lg" name="username"
                                placeholder="Username" autocomplete="off" required>
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-3">
                            <input type="password" class="form-control form-control-lg" name="password"
                                placeholder="Password" autocomplete="off" id="password" required>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <div class="form-check form-check-lg d-flex align-items-end">
                            <input class="form-check-input me-2" type="checkbox" value="" id="flexCheckDefault"
                                onclick="ShowPassword()">
                            <label class="form-check-label text-gray-600" for="flexCheckDefault">
                                Show Password
                            </label>
                        </div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-4" type="submit" name="login">Log
                            in</button>
                    </form>
                </div>
                <!-- /To be continue 
                <div class="text-center mt-4 text-lg fs-5">
                    <p><a class="font-bold" href="auth-forgot-password.php">Forgot password?</a>.</p>
                </div>
                    -->
            </div>
        </div>
    </div>
    </div>
</body>
<script type="text/javascript" src="assets/js/pages/showpassword.js"></script>

</html>