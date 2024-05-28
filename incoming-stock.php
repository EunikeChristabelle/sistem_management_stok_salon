<?php
    session_start();
    
    if( !isset($_SESSION["login"]))
    {
        header("Location: index.php");
        exit;
    }

    require 'functions.php';

    if($type == "Kasir")
    {
        header("Location: index.php");
        exit;
    }

    if( isset($_POST["add"]))
    {
        // cek apakah data berhasil di tambahkan atau tidak
        if(add_incoming_stock($_POST) > 0)
        {
            echo "
                <script>
                    alert('Incoming stock berhasil ditambah!');
                    document.location.href = 'incoming-stock.php';
                </script>
            ";
        }
        else
        {
            echo "
                <script>
                    alert('Incoming stock gagal ditambah!');
                </script>
            ";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Incoming Stock - Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<style>
    .selected{
        border: 1px lightgray solid; 
        border-radius: 5px;
    }
</style>

<body>
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="dashboard.php"><img src="assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="menu" id="navMenus">
                    <li class="sidebar-title">Menu</li>

                    <li class="sidebar-item">
                        <a href="dashboard.php" class="sidebar-link">
                            <i class="bi bi-grid-fill"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <?php
                        if($type != "Kasir")
                        {
                    ?>
                        <li class="sidebar-item">
                            <a href="suppliers.php" class="sidebar-link">
                                <i class="bi bi-truck-front-fill"></i>
                                <span>Suppliers</span>
                            </a>
                        </li>

                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-box-seam-fill"></i>
                                <span>Items</span>
                            </a>
                            <ul class="submenu">
                                <li class="submenu-item ">
                                    <a href="item-list.php">Item List</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="item-category.php">Item Category</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }
                        
                        if($type == "Admin")
                        {
                    ?>    
                        <li class="sidebar-item has-sub active">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-archive-fill"></i>
                                <span>Stock</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="stock-item.php">Stock Item</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="incoming-stock.php">Incoming Stock</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="out-of-stock.php">Out of Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type == "Gudang")
                        {
                    ?>
                        <li class="sidebar-item has-sub active">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-archive-fill"></i>
                                <span>Stock</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="stock-item.php">Stock Item</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="incoming-stock.php">Incoming Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type != "Kasir")
                        {
                    ?>
                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-file-text-fill"></i>
                                <span>Reports</span>
                            </a>
                            <ul class="submenu">
                                <li class="submenu-item ">
                                    <a href="reports-incoming.php">Incoming Stock</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="reports-out.php">Out of Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type == "Kasir")
                        {
                    ?>
                        <li class="sidebar-item has-sub active">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-archive-fill"></i>
                                <span>Stock</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="stock-item.php">Stock Item</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="out-of-stock.php">Out of Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type == "Admin")
                        {
                    ?>
                        <li class="sidebar-item">
                            <a href="account-list.php" class="sidebar-link" onclick="active()">
                                <i class="bi bi-person-badge-fill"></i>
                                <span>Account</span>
                            </a>
                        </li>
                    <?php    
                        }
                    ?>
                    
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-bs-toggle="modal" data-bs-target="#logoutModal">
                            <i class="bi bi-door-closed-fill"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>

    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>
        

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Incoming Stock</h3>
                        <p class="text-subtitle text-muted">For user to check incoming stock list</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Incoming Stock</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <button type="Add" class="btn btn-primary me-1 mb-1" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Add</button>
                    </div>
                    <div class="card-body">
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Incoming Stock</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form class="form form-vertical" action="" method="POST">
                                        <div class="modal-body">
                                            <!-- Basic Vertical form layout section start -->
                                                <div class="form-body">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="name">Item Name:</label>
                                                            <select id="name" class="form-control" name="name">
                                                                <option value="0" selected hidden>Please select the item</option>
                                                                <?php
                                                                    $sSQL="";
                                                                    $sSQL="SELECT tb_item.name, tb_item.id FROM tb_stock 
                                                                    INNER JOIN tb_item ON tb_stock.item = tb_item.id order by name";
                                                                    $result=mysqli_query($conn, $sSQL);
                                                                    if (mysqli_num_rows($result) > 0) 
                                                                    {
                                                                        while ($row=mysqli_fetch_assoc($result))
                                                                        {
                                                                            $name = $row['name'];
                                                                            $id = $row['id'];
                                                                            
                                                                            if($name != $s_name)
                                                                            {
                                                                                echo "<option value='$id'>$name</option>";
                                                                            }

                                                                            $s_name = $name;
                                                                        }
                                                                    }
                                                                ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="amount">Amount:</label>
                                                            <input type="number" id="amount"
                                                                class="form-control" name="amount"
                                                                placeholder="Input Amount" autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="supplier">Supplier:</label>
                                                            <select id="supplier" class="form-control" name="supplier"> 
                                                                <option value="0" selected disabled>...</option>
                                                            </select>
                                                            <script type="text/javascript">
                                                                $("#name").change(function()
                                                                {
                                                                    var x = $("#name").val();
                                                                    xmlhtpp = new XMLHttpRequest();
                                                                    xmlhtpp.open("GET","action_supplier.php?items="+x,false);
                                                                    xmlhtpp.send(null);
                                                                    $("#supplier").html(xmlhtpp.responseText)
                                                                });
                                                            </script>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="category">Category:</label>
                                                            <select id="category" class="form-control" name="category"> 
                                                                <option value="0" selected>...</option>
                                                            </select>
                                                            <script type="text/javascript">
                                                                $("#name").change(function()
                                                                {
                                                                    var x = $("#name").val();
                                                                    var y = $("#supplier").val();
                                                                    var z ="items="+x+"&supplier="+y;
                                                                    xmlhtpp = new XMLHttpRequest();
                                                                    xmlhtpp.open("GET","action_category.php?"+z,false);
                                                                    xmlhtpp.send(null);
                                                                    $("#category").html(xmlhtpp.responseText)
                                                                });

                                                                $("#supplier").change(function()
                                                                {
                                                                    var x = $("#name").val();
                                                                    var y = $("#supplier").val();
                                                                    var z ="items="+x+"&supplier="+y;
                                                                    xmlhtpp = new XMLHttpRequest();
                                                                    xmlhtpp.open("GET","action_category.php?"+z,false);
                                                                    xmlhtpp.send(null);
                                                                    $("#category").html(xmlhtpp.responseText)
                                                                });
                                                            </script>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="description">Description:</label>
                                                            <textarea type="text" id="description"
                                                                class="form-control" name="description" rows="4" cols="50" autocomplete="off"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            <!-- // Basic Vertical form layout section end -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="cancel" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">Cancel</button>
                                            <button type="submit" name="add" class="btn btn-primary me-1 mb-1">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped" id="table1" width="100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Date</th>
                                <th>Item Name</th>
                                <th>Supplier</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $sSQL="";
                                $sSQL="SELECT tb_incoming_stock.id, tb_item.name, tb_supplier.name AS supplier, tb_category.category, tb_incoming_stock.date, 
                                    tb_incoming_stock.description, tb_incoming_stock.amount FROM tb_incoming_stock 
                                    INNER JOIN tb_supplier ON tb_incoming_stock.supplier = tb_supplier.id
                                    INNER JOIN tb_item ON tb_incoming_stock.name = tb_item.id
                                    INNER JOIN tb_category ON tb_item.category = tb_category.id
                                    ORDER BY date";
                                /*$sSQL="SELECT * FROM tb_incoming_stock ORDER BY date";*/
                                
                                $result=mysqli_query($conn, $sSQL);
                                if (mysqli_num_rows($result) > 0) 
                                {
                                    $no = 0;
                                    while ($row=mysqli_fetch_assoc($result))
                                    {
                                        $id = $row['id'];
                                        $description= $row['description'];
                                        $amount = $row['amount'];

                                        $s_date = $row['date'];
                                        $date = date("d M Y", strtotime($s_date));
                                        
                                        $name = $row['name'];
                                        $supplier = $row['supplier'];
                                        $category = $row['category'];
                                        $no = $no + 1;
                                        
                                        
                            ?>		
                                    <tr>
                                        <td width="4%"><?php echo $no;?></td>
                                        <td><?php echo $date;?></td>
                                        <td><?php echo $name;?></td>
                                        <td><?php echo $supplier;?></td>
                                        <td><?php echo $category;?></td>
                                        <td><?php echo $description;?></td>
                                        <td><?php echo $amount;?></td>
                                        <td width="4%">
                                            <a href="update_incoming-stock.php?id=<?php echo $id?>"><button class='btn btn-primary'>UPDATE</button></a>
                                        </td>
                                    </tr>   
                            <?php	   
                                    }
                                } 
                            ?>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Ready to Leave?</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button type="cancel" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">Cancel</button>
                    <a href="logout.php"><button type="submit" name="logout" class="btn btn-primary me-1 mb-1">Logout</button></a>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/vendors/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }
          
        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>
    <script src="assets/js/main.js"></script>
</body>

</html>