<?php


include('config/db_connect.php');


$email = $title = $description = $ISBN_code = $publish_date = $status = $type = $image = $author = $publisher ='';
$errors = array('email'=>'', 'title'=>'', 'description'=>'', 'ISBN_code'=>'', 'publish_date'=>'', 'status'=>'', 'type'=>'', 'image'=>'', 'author'=>'', 'publisher'=>'');


if(isset($_POST['submit'])){

    if(empty($_POST['email'])){
        $errors['email'] = 'An email is required! <br>';
        } else {
        $email = $_POST['email'];
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $errors['email'] = 'email must be a valid email adress';
        }
    }

    if(empty($_POST['title'])){
        $errors['title'] = 'A title is required! <br>';
    } else {
        $title = $_POST['title'];
    }

    if(empty($_POST['description'])){
        $errors['description'] = 'A description is required!<br>';
    } else {
        $description = $_POST['description'];
    }

    if(empty($_POST['ISBN_code'])){
        $errors['ISBN_code'] = 'Enter a valid ISBN Code!<br>';
    } else {
        $ISBN_code = $_POST['ISBN_code'];
    }

    if(empty($_POST['publish_date'])){
        $errors['publish_date'] = 'Enter a publish date!<br>';
    } else {
        $publish_date = $_POST['publish_date'];
    }

    if(empty($_POST['status'])){
        $errors['status'] = 'Enter if this media is aviable!<br>';
    } else {
        $status = $_POST['status'];
    }

    if(empty($_POST['type'])){
        $errors['type'] = 'Enter the type of this media (book, CD, DVD)<br>';
    } else {
        $type = $_POST['type'];
    }

    if(empty($_POST['image'])){
        $errors['image'] = 'Enter the type of this media (book, CD, DVD)<br>';
    } else {
        $image = $_POST['image'];
    }

    if(empty($_POST['author'])){
        $errors['author'] = 'Enter name of the auther<br>';
    } else {
        $author = $_POST['author'];
    }

    if(empty($_POST['publisher'])){
        $errors['publisher'] = 'Enter name of the publisher<br>';
    } else {
        $publisher = $_POST['publisher'];
    }

    if(array_filter($errors)){
    } else {

        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $title = mysqli_real_escape_string($conn, $_POST['title']);
        $description = mysqli_real_escape_string($conn, $_POST['description']);
        $ISBN_code = mysqli_real_escape_string($conn, $_POST['ISBN_code']);
        $publish_date = mysqli_real_escape_string($conn, $_POST['publish_date']);
        $status = mysqli_real_escape_string($conn, $_POST['status']);
        $type = mysqli_real_escape_string($conn, $_POST['type']);
        $image = mysqli_real_escape_string($conn, $_POST['image']);
        $author = mysqli_real_escape_string($conn, $_POST['author']);
        $author = mysqli_real_escape_string($conn, $_POST['publisher']);

        $sql = "INSERT INTO books(email,title,description,ISBN_code,publish_date,status,type,image,author,publisher) VALUES('$email','$title', '$description','$ISBN_code','$publish_date','$status','$type','$image','$author','$publisher')";

        if(mysqli_query($conn, $sql)){
            header('Location: index.php');
        } else {
            echo 'query error: ' . mysqli_error($conn);
        }

    }

}
?>


<!DOCTYPE html>
<html lang="en">

<?php include('templates/header.php'); ?>

<section class="container grey-text">
    <h4 class="center">Add a book</h4>
    <form class="white" action="add.php" method="POST">
        <label>Your Email:</label>
        <input type="text" name="email" value="<?php echo htmlspecialchars ($email) ?>">
        <div class="red-text"><?php echo $errors['email']; ?></div>
        <label>Title:</label>
        <input type="text" name="title" value="<?php echo htmlspecialchars ($title) ?>">
        <div class="red-text"><?php echo $errors['title']; ?></div>
        <label>Author:</label>
        <input type="text" name="author" value="<?php echo htmlspecialchars ($author) ?>">
        <div class="red-text"><?php echo $errors['author']; ?></div>
        <label>Publisher:</label>
        <input type="text" name="publisher" value="<?php echo htmlspecialchars ($publisher) ?>">
        <div class="red-text"><?php echo $errors['publisher']; ?></div>
        <label>Description:</label>
        <input type="text" name="description" value="<?php echo htmlspecialchars ($description) ?>">
        <div class="red-text"><?php echo $errors['description']; ?></div>
        <label>ISBN:</label>
        <input type="text" name="ISBN_code" value="<?php echo htmlspecialchars ($ISBN_code) ?>">
        <div class="red-text"><?php echo $errors['ISBN_code']; ?></div>
        <label>Publish date:</label>
        <input type="date" name="publish_date" value="<?php echo htmlspecialchars ($publish_date) ?>">
        <div class="red-text"><?php echo $errors['publish_date']; ?></div>
        <label>Status:</label>
        <input type="text" name="status" value="<?php echo htmlspecialchars ($status) ?>">
        <div class="red-text"><?php echo $errors['status']; ?></div>
        <label>Media type:</label>
        <input type="text" name="type" value="<?php echo htmlspecialchars ($type) ?>">
        <div class="red-text"><?php echo $errors['type']; ?></div>
        <label>Image (URL):</label>
        <input type="text" name="image" value="<?php echo htmlspecialchars ($image) ?>">
        <div class="red-text"><?php echo $errors['image']; ?></div>
        

        <div class="center">
            <input type="submit" name="submit" value="submit" class="btn brand z-depth-0">
        </div>
    </form>
</section>

<?php include('templates/footer.php'); ?>

</html>