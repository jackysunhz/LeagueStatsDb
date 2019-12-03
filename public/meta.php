<?php


require "../config.php";
require "../common.php";

  try  {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "SELECT* FROM view_meta";
    $statement = $connection->prepare($sql);
    $statement->execute();

    $result = $statement->fetchAll();
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }

?>
<?php require "templates/header.php"; ?>


<h2>
    Here are the top tier winning champions in 2017!
</h2>

 <?php
 ?>
      <h2>Results</h2>
      <table align = "center">
        <thead>
          <tr>
            <th>Champion Name</th>
            <th>Avg Win Rate</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach ($result as $row) : ?>
          <tr>
            <td><?php echo escape($row["name"]); ?></td>
            <td><?php echo escape($row["rate"]); ?></td>
          </tr>
        <?php endforeach; ?>
        </tbody>
      </table>
      <?php
  ?>


    <p style="text-align: center"><a href="index.php">
    Back to home
</a></p>
<?php require "templates/footer.php"; ?>