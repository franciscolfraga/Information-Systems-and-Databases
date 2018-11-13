<?php
  session_start();

  $conn = new PDO('pgsql:host=dbm.fe.up.pt;port=5432;dbname=sibd1812', 'sibd1812', '9RONM1945N');
  $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $conn->query("SET SCHEMA 'Project'");
  if (isset($_SESSION['error_message'])) {
    $_ERROR_MESSAGE = $_SESSION['error_message'];
    unset($_SESSION['error_message']);
  }

  if (isset($_SESSION['success_message'])) {
    $_SUCCESS_MESSAGE = $_SESSION['success_message'];
    unset($_SESSION['success_message']);
  }

  if (isset($_SESSION['form_values'])) {
    $_FORM_VALUES = $_SESSION['form_values'];
    unset($_SESSION['form_values']);
  }
?>
