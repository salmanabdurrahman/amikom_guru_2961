<?php include 'koneksi.php'; ?>
<?php include 'header.php'; ?>
<?php
if (!isset($_SESSION['guru']) or empty($_SESSION['guru'])) {
    echo "<script>alert('Eits, Anda harus login!');</script>";
    echo "<script>location='login.php';</script>";
    exit();
}
?>

<section style="min-height: 400px;">
    <div class="container">
        <div class="card border-0 shadow-sm mb-3">
            <div class="card-body">
                <h6>Selamat Datang Guru <?php echo $_SESSION['guru']['nama_guru']; ?></h6>
                <p class="lead">Melalui panel ini, Anda dapat membuat kelas dan melakukan presensi siswa</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="card card-body text-center border-0 shadow-sm">
                    <i class="bi bi-person"></i>
                    <h6>Akun</h6>
                </div>
            </div>
            <div class="col-md-2">
                <a href="kelas.php" class="text-decoration-none text-dark">
                    <div class="card card-body text-center border-0 shadow-sm">
                        <i class="bi bi-bank"></i>
                        <h6>Kelas</h6>
                    </div>
                </a>
            </div>
            <div class="col-md-2">
                <a href="sesi.php" class="text-decoration-none text-dark">
                    <div class="card card-body text-center border-0 shadow-sm">
                        <i class="bi bi-people"></i>
                        <h6>Presensi</h6>
                    </div>
                </a>
            </div>
            <div class="col-md-2" onclick="location='logout.php';" role="button">
                <div class="card card-body text-center border-0 shadow-sm">
                    <i class="bi bi-x-circle"></i>
                    <h6>Logout</h6>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>