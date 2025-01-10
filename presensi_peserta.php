<?php
include 'koneksi.php';

$id_sesi = $_GET['id_sesi'];

$presensi = array();
$query = "SELECT * FROM presensi LEFT JOIN siswa ON presensi.nis COLLATE utf8mb4_general_ci = siswa.nis COLLATE utf8mb4_general_ci WHERE id_sesi = '$id_sesi'";
$ambil = $koneksi->query($query);
while ($tiap = $ambil->fetch_assoc()) {
    $presensi[] = $tiap;
}
?>

<?php foreach ($presensi as $key => $value): ?>
    <tr>
        <td><?php echo $key + 1 ?></td>
        <td><?php echo $value['nis'] ?></td>
        <td><?php echo $value['nama_siswa'] ?></td>
        <td><?php echo $value['waktu'] ?></td>
    </tr>
<?php endforeach ?>