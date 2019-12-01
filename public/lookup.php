<?php

/**
 * Function to query information based on 
 * a parameter: in this case, location.
 *
 */

require "../config.php";
require "../common.php";

if (isset($_POST['submit'])) {
  if (!hash_equals($_SESSION['csrf'], $_POST['csrf'])) die();

  try  {
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "select champs.name as name, sum(stats.win) / count(*) as rate
           from (champs inner join participants on champs.id = participants.championid)inner join stats on participants.id = stats.id
           where champs.name = :name";

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


<?php
if (isset($_POST['submit'])) {
  if ($result && $statement->rowCount() > 0) { ?>
    <h2>Results</h2>

    <table>
      <thead>
        <tr>
          <th>Champion Name</th>
          <th>Win Rate</th>
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
    <?php } else { ?>
      <blockquote>Sorry we can not find anything<?php echo escape($_POST['location']); ?>.</blockquote>
    <?php } 
} ?> 

<h2>
    input game end time and find the champion with highest win rate
</h2>

<form method="post">

  <input name="csrf" type="hidden" value="<?php echo escape($_SESSION['csrf']); ?>">
  <label for="location">Champion Name</label>
  <input type="text" id="id" name="name">
  <input type="submit" name="submit" value="search">
</form>
    <p style="text-align: center"><a href="index.php">
    Back to home
</a></p>

<?php require "templates/footer.php"; ?>