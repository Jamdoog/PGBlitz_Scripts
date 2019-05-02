<?php
if(isset($_GET["Link"], $_GET["Name"])) {
    function doThing($link, $name) {
        $output = shell_exec(`animedl $link $name`);
        return $output;
    }
}
?>

<!DOCTYPE html>
<htmL>
<body>
<form>
  Link
  <br>
  <input type="text" name="Link">
  <br>Name<br>
  <input type="text" name="Name">
  <input type="submit" value="Submit">
</form> 
</body>
</html>