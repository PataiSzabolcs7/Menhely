<?php
if (filter_input(INPUT_POST, "regisztraciosAdatok", FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE)) {
    $pass1 = filter_input(INPUT_POST, "InputPassword");
    $pass2 = filter_input(INPUT_POST, "InputPassword2");
    $szigszam = filter_input(INPUT_POST, "szigszam");
    $emails = filter_input(INPUT_POST, "useremail");
    $usersnames = filter_input(INPUT_POST, "felhasznalonev");
    $name = htmlspecialchars(filter_input(INPUT_POST, "username"));
    echo 'eddig jó';
    if ($pass1 == $pass2) {
        //-- regisztráció indítása
        $db->register($name, $pass1,$szigszam,$emails,$usersnames);
        header("Location:index.php"); //-- átvált a nyitólapra
    } else {
        echo '<p>Nem egyeznek a jelszavak!</p>';
    }
} else {
    echo 'nem ok!';
}
?>
<div class="col-8 mx-auto">
    <form action="#" method="post">
        <div class="mb-3">
            <label for="felhasznalonev" class="form-label">Felhasználó teljes neve</label>
            <input type="text" class="form-control" id="felhasznalonev" name="felhasznalonev" aria-describedby="felhasznalonevHelp">
            <div id="felhasznalonevHelp" class="form-text">Ez szerepel majd az örökbefogadási szerződésen.</div>
        </div>
        <div class="row">
            <div class="mb-3 col-7">
                <label for="useremail" class="form-label">Email cím</label>
                <input type="text" class="form-control" id="useremail" name="useremail" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">Kapcsolattartási célból.</div>
            </div>
            <div class="mb-3 col-auto">
                <label for="szigszam" class="form-label">Személyigazolvány száma:</label>
                <input type="text" class="form-control" id="szigszam" name="szigszam" aria-describedby="szigszamHelp">
                <div id="szigszamHelp" class="form-text">A pontos beazonosítás miatt.</div>
            </div>
        </div>
        <div class="mb-3">
            <label for="username" class="form-label">Felhasználó név</label>
            <input type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp">
            <div id="usernameHelp" class="form-text">Bejelentkezéshez.</div>
        </div>
        <div class="row">
            <div class="mb-3 col-6">
                <label for="InputPassword" class="form-label">Jelszó</label>
                <input type="password" class="form-control" id="InputPassword" name="InputPassword">
            </div>
            <div class="mb-3 col-6">
                <label for="InputPassword2" class="form-label">Jelszó még egyszer</label>
                <input type="password" class="form-control" id="InputPassword2" name="InputPassword2">
            </div>
        </div>
        <button type="submit" class="btn btn-primary" name="regisztraciosAdatok" value="true">Regisztráció</button>
    </form>
</div>
