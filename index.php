<?php
  include '../../../config.php';
  include 'mancala.php';

  $sql = "select name, type from hole";
  $result = executeQuery($sql);
  $board = convertQueryToBoard($result);
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Raven's Mancala">
    <meta name="author" content="Raven">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link rel="icon" href="../../assets/img/favicon.ico">
    <title>Raven's Mancala</title>
    <link href="assets/css/include.css" rel="stylesheet">
    <link href="../../assets/css/include.css" rel="stylesheet">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/css/cover.css" rel="stylesheet">
    <link href="../../assets/css/grid.css" rel="stylesheet">
  </head>

  <body class="text-center" style="background-image: url('../../assets/img/tron.jpg'); background-position: 58.33325% center;">

    <div class="cover-container w-100 h-100 p-3 mx-auto flex-column">
      <div id="game-container">
          <?php
            displayBoard( $board );
          ?>
      </div>
    </div>

    <script src="../../assets/js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/jquery.min.js"><\/script>')</script>
    <script src="../../assets/js/popper.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
  </body>
</html>
