<?php

include('config/db_connect.php');

if(isset($_POST['delete'])){

    $id_to_delete = mysqli_real_escape_string($conn, $_POST['id_to_delete']);

    $sql = "DELETE FROM books WHERE id = $id_to_delete";

    if(mysqli_query($conn, $sql)){

        header('Location: index.php');
    } {

        echo 'query error: ' . mysqli_error($conn);
    }
}

if(isset($_GET['id'])){

    $id = mysqli_real_escape_string($conn, $_GET['id']);

    $sql = "SELECT * FROM books WHERE id = $id";

    $result = mysqli_query($conn, $sql);

    $book = mysqli_fetch_assoc($result);

    mysqli_free_result($result);
    mysqli_close($conn);

}

?>

<!DOCTYPE html>
<html lang="en">

<?php include('templates/header.php'); ?>



<div class="container center">
    <?php if ($book): ?>
    <div>
        <h6 class="type"><?php echo htmlspecialchars($book['type']); ?></h6>
        <h6 class="status"><b>Status: </b><?php echo htmlspecialchars($book['status']); ?></h6>
    </div>
    <h4><?php echo htmlspecialchars($book['title']); ?></h4>
    <img src="<?php echo htmlspecialchars($book['image']); ?>"></img>
    <h6><b>Description: </b><?php echo htmlspecialchars($book['description']); ?></h6>
    <br>
    <h6><b>Author: </b><?php echo htmlspecialchars($book['author']); ?></h6>
    <br>
    <h6><b>Publisher: </b><?php echo htmlspecialchars($book['publisher']); ?></h6>
    <br>
    <h6><b>Published: </b><?php echo htmlspecialchars($book['publish_date']); ?></h6>
    <br>
    <h6><b>ISBN: </b><?php echo htmlspecialchars($book['ISBN_code']); ?></h6>
    <br>
    <br>
    <hr>
    <p><b>Uploaded by: </b><?php echo htmlspecialchars($book['email']); ?></p>
    <p><b>Uploaded: </b> <?php echo htmlspecialchars($book['created_at']); ?></p>

    <form action="details.php" method="POST">
        <input type="hidden" name="id_to_delete" value="<?php echo $book['id'] ?>">
        <input type="submit" name="delete" value="Delete" class="btn brand z-depth-0">
    </form>


    <?php else: ?>

    <h5>This book doesnt exist</h5>

    <?php endif; ?>

</div>
<?php include('templates/footer.php'); ?>


</html>