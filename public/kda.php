<?php
require "../config.php";
require "../common.php";

if (isset($_POST['submit'])) {
  if (!hash_equals($_SESSION['csrf'], $_POST['csrf'])) die();

  try  {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "CALL check_KDA(:name)";

    $name = $_POST['name'];
    $statement = $connection->prepare($sql);
    $statement->bindParam(':name', $name, PDO::PARAM_STR);
    $statement->execute();

    $result = $statement->fetchAll();
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }
}
?>
<?php require "templates/header.php"; ?>


<h2>
    Type in champion name to find the average player performance using that champ!
</h2>

<form method="post">

  <input name="csrf" type="hidden" value="<?php echo escape($_SESSION['csrf']); ?>">
  <label for="location">Champion Name</label>
  <input type="text" id="id" name="name">
  <input type="submit" name="submit" value="search">
  <?php
  if (isset($_POST['submit'])) {
    if ($result && $statement->rowCount() > 0) { ?>
      <h2>Results</h2>
      <table align = "center">
        <thead>
          <tr>
            <th>Champion Name</th>
            <th>Avg KDA</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach ($result as $row) : ?>
          <tr>
            <td><?php echo escape($row["name"]); ?></td>
            <td><?php echo escape($row["Avg_KDA"]); ?></td>
          </tr>
        <?php endforeach; ?>
        </tbody>
      </table>
      <?php } else { ?>
        <blockquote>Sorry we can not find anything<?php echo escape($_POST['name']); ?>.</blockquote>
      <?php }
  } ?>

</form>
    <p style="text-align: center"><a href="index.php">
    Back to home
</a></p>
<?php require "templates/footer.php"; ?>