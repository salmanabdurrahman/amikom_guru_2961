<?php
include 'koneksi.php';
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="bg-light">
    <section class="py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-md-4 offset-md-4 bg-white p-5 shadow rounded">
                    <div class="text-center">
                        <img src="./img/logo.png" alt="ogo-amikom" title="logo-amikom" width="100" loading="lazy">
                        <h6 class="mt-3">Login Guru SMK Amikom</h6>
                    </div>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="">NIK</label>
                            <input type="text" name="nik" id="" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="">Password</label>
                            <input type="password" name="password" id="" class="form-control">
                        </div>
                        <button class="btn btn-primary" name="login">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>

</html>

<?php
if (isset($_POST["login"])) {
    $nik = $_POST["nik"];
    $password = $_POST["password"];

    $ambil = $koneksi->query("SELECT * FROM guru WHERE nik_guru = '$nik' AND password_guru = '$password'");
    $cek_guru = $ambil->fetch_assoc();

    if (empty($cek_guru)) {
        echo "<script>alert('Gagal, akun tidak tidak valid!');</script>";
        echo "<script>location='login.php';</script>";
        exit();
    } else {
        $_SESSION['guru'] = $cek_guru;
        echo "<script>alert('Berhasil, selamat datang!');</script>";
        echo "<script>location='index.php';</script>";
    }
}
?>