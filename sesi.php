<?php include 'koneksi.php'; ?>
<?php include 'header.php'; ?>
<?php
if (!isset($_SESSION['guru']) or empty($_SESSION['guru'])) {
    echo "<script>alert('Eits, Anda harus login!');</script>";
    echo "<script>location='login.php';</script>";
    exit();
}

$nik = $_SESSION['guru']['nik_guru'];
$kelas = array();
$ambil = $koneksi->query("SELECT * FROM kelas WHERE nik_guru = $nik");

while ($tiap = $ambil->fetch_assoc()) {
    $kelas[] = $tiap;
}
?>

<section class="py-5">
    <div class="container">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6>Tambah Sesi Presensi</h6>
                <form action="" method="post">
                    <div class="mb-3">
                        <label for="">Kelas</label>
                        <select class="form-control form-select" name="kode_kelas" id="">
                            <option value="">Pilih</option>
                            <?php foreach ($kelas as $key => $value) { ?>
                                <option value="<?php echo $value['kode_kelas'] ?>">
                                    <?php echo $value['nama_mapel'] ?>
                                </option>
                            <?php } ?>

                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="">Sesi Ke</label>
                        <input type="number" name="ke_sesi" min="1" max="30" id="" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="">Materi</label>
                        <input type="text" name="materi_sesi" id="" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="">Bahasan</label>
                        <textarea name="bahasan_sesi" id="" class="form-control"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" name="kirim">Kirim</button>
                </form>
            </div>
        </div>
    </div>
</section>

<?php
if (isset($_POST['kirim'])) {
    $kode_kelas = $_POST['kode_kelas'];
    $ke_sesi = $_POST['ke_sesi'];
    $materi_sesi = $_POST['materi_sesi'];
    $bahasan_sesi = $_POST['bahasan_sesi'];
    $kode_sesi = generateRandomString(5);

    $query = "INSERT INTO sesi (kode_kelas, materi_sesi, bahasan_sesi, kode_sesi, ke_sesi) 
              VALUES ('$kode_kelas', '$materi_sesi', '$bahasan_sesi', '$kode_sesi', '$ke_sesi')";

    $koneksi->query($query);
    $id_sesi = $koneksi->insert_id;

    echo "<script>alert('Silahkan Presensi');</script>";
    echo "<script>location=presensi.php?id_sesi=$id_sesi;</script>";
}
?>

<?php include 'footer.php'; ?>