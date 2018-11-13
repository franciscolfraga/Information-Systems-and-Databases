<!DOCTYPE html>
<?php include ('config/init.php');?>
<html lang="en-US">
  <head>
   <title>SIBD</title>
  </head>
  <body>
    <form method="post" action="/actions/register.php">
      <table>
        <tr>
          <td><label>NAME:<input type="text" name="name"></label></td>
        </tr>
        <tr>
          <td><label>EMAIL:<input type="email" name="email"></label></td>
        </tr>
        <tr>
          <td><label>PASSWORD:<input type="password" name="password"></label></td>
        </tr>
      </table>
      <label>
        <input type="submit" value="Register">
      </label>
    </form>
    <?php if (isset($_ERROR_MESSAGE)) { ?>
    <div id="errors">
      <?=$_ERROR_MESSAGE?>
    </div>
    <?php } ?>

    <?php if (isset($_SUCCESS_MESSAGE)) { ?>
    <div id="success">
      <?=$_SUCCESS_MESSAGE?>
    </div>
    <?php } ?>
  </body>
</html>
