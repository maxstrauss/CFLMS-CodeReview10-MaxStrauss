<?php

include('config/db_connect.php');

    $sql = 'SELECT title, type, image, status, author, id FROM books ORDER BY created_at';
    

    $result = mysqli_query($conn, $sql);

    $books = mysqli_fetch_all($result, MYSQLI_ASSOC);

    mysqli_free_result($result);

    mysqli_close($conn);


?>



<!DOCTYPE html>
<html lang="en">

<?php include('templates/header.php'); ?>

<h4 class="center grey-text">Books: </h4>

<div class="container">
    <div class="row">

        <?php foreach($books as $book): ?>

        <div class="col s6 md3">
            <div class="card z-depth-0">
                <div class="card-content center">
                    <h6 class="type"><?php echo htmlspecialchars($book['type']); ?></h6>
                    <h6 class="status"><b>Status: </b><?php echo htmlspecialchars($book['status']); ?></h6>
                    <h4><?php echo htmlspecialchars($book['title']); ?></h4>
                    <h5><?php echo htmlspecialchars($book['author']); ?></h5>
                    <img src="<?php echo htmlspecialchars($book['image']); ?>"></img>
                </div>
                <div class="card-action center">
                    <a class="brand-text" href="details.php?id=<?php echo $book['id']?>">more info</a>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>



<?php include('templates/footer.php'); ?>


</html>