<?php
//-- a visszaküldendő fájl tartalmának a beállítása
header('Content-Type: text/html; charset=utf-8');
session_start(); //-- munkamenet adatinak tárolására $_SESSION[]
require_once './classes/Database.php';
$param5_value = 'szigszam';
$param6_value = 'emails';
$param7_value = 'usernames';
$db = new Database("localhost", "root", "", $param5_value, $param6_value, $param7_value, "menhely");

if (!isset($_SESSION['login'])){$_SESSION['login'] = false;}

require_once './layout/head.php';
?>
<body>
    <?php
    $menu = filter_input(INPUT_GET, "menu");

    require_once './layout/header.php';
    require_once './layout/menu.php';
    require_once './tartalom.php';
    require_once './layout/footer.php';
    ?>
    <script src="./bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
