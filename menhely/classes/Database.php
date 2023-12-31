<?php

class Database {

    private $db = null;

    public function __construct($host, $username, $pass, $szigszam, $emails, $usersnames, $db) {
        $this->db = new mysqli($host, $username, $pass, $szigszam, $emails, $usersnames, $db);
    }

    public function login($name, $pass) {
        //-- jelezzük a végrehajtandó SQL parancsot
        $stmt = $this->db->prepare('SELECT * FROM users WHERE users.name LIKE ?;');
        //-- elküldjük a végrehajtáshoz szükséges adatokat
        $stmt->bind_param("s", $name);

        if ($stmt->execute()) {
            //-- sikeres végrehajtás után lekérjük az adatokat
            $result = $stmt->get_result();
            $row = $result->fetch_assoc();
            echo '<pre>';
            var_dump($row);
            var_dump(password_hash($pass, PASSWORD_ARGON2I));
            echo '</pre>';
            if ($pass == $row['password']) {
                //-- felhasználónév és jelszó helyes
                $_SESSION['username'] = $row['name'];
                $_SESSION['login'] = true;
            } else {
                $_SESSION['username'] = '';
                $_SESSION['login'] = false;
            }
            // Free result set
            $result->free_result();
            header("Location:index.php");
        }
        return false;
    }

    public function register($name, $pass, $szigszam, $emails, $usersnames) {
        //$password = password_hash($pass, PASSWORD_ARGON2I);
        $stmt = $this->db->prepare("INSERT INTO `users` (`name`, `password`) VALUES (?, ?);");
        $stmt->bind_param("ss", $name, $pass , $szigszam, $emails, $usersnames);
        if ($stmt->execute()) {
            //echo $stmt->affected_rows();
            $_SESSION['login'] = true;
            //header("Location: index.php");
        } else {
            $_SESSION['login'] = false;
            echo '<p>Rögzítés sikertelen!</p>';
        }
    }
}
