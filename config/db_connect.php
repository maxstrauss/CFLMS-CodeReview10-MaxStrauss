<?php

    $conn = mysqli_connect('localhost', 'test', 'test1234', 'cr10_max_strauss_biglibrary');

    if(!$conn){
        echo 'Connection error: ' . mysqli_connect_error();
    }
?>