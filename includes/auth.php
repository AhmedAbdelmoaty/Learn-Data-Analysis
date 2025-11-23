<?php
session_start();

function isLoggedIn() {
    return isset($_SESSION['admin_id']) && isset($_SESSION['admin_email']);
}

function currentUserRole() {
    return $_SESSION['admin_role'] ?? null;
}

function hasRole($roles) {
    if (!is_array($roles)) {
        $roles = [$roles];
    }

    return isLoggedIn() && currentUserRole() && in_array(currentUserRole(), $roles, true);
}

function requireRole($roles) {
    if (!hasRole($roles)) {
        header('Location: dashboard.php');
        exit;
    }
}

function requireLogin() {
    if (!isLoggedIn()) {
        header('Location: login.php');
        exit;
    }
}

function login($admin_id, $email, $name, $role = 'admin') {
    $_SESSION['admin_id'] = $admin_id;
    $_SESSION['admin_email'] = $email;
    $_SESSION['admin_name'] = $name;
    $_SESSION['admin_role'] = $role;
    $_SESSION['last_activity'] = time();
}

function logout() {
    session_unset();
    session_destroy();
    header('Location: login.php');
    exit;
}

function checkSessionTimeout($timeout = 3600) {
    if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > $timeout)) {
        logout();
    }
    $_SESSION['last_activity'] = time();
}
?>
