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
                <h6>Kelas</h6>
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Kode Kelas</th>
                            <th>Nama Mapel</th>
                            <th>NIK Guru</th>
                            <th>Nama Guru</th>
                            <th>Tahun Ajaran</th>
                            <th>Semester</th>
                            <th>Opsi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($kelas as $key => $value) { ?>
                            <tr>
                                <td><?php echo $key + 1; ?></td>
                                <td><?php echo $value['kode_kelas']; ?></td>
                                <td><?php echo $value['nama_mapel']; ?></td>
                                <td><?php echo $value['nik_guru']; ?></td>
                                <td><?php echo $value['nama_guru']; ?></td>
                                <td><?php echo $value['tahun_ajaran']; ?></td>
                                <td><?php echo $value['semester']; ?></td>
                                <td>
                                    <a href="peserta.php?id_kelas=<?php echo $value['id_kelas']; ?>"
                                        class="btn btn-info btn-sm">Peserta</a>
                                    <a href="" class="btn btn-success btn-sm">Rekap Presensi</a>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>

                <a href="kelas_tambah.php" class="btn btn-primary">Buat Baru</a>
            </div>
        </div>
</section>

<?php include 'footer.php'; ?>