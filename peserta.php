<?php
include 'koneksi.php';
include 'header.php';

$id_kelas = $_GET["id_kelas"];

include 'vendor/autoload.php';

# Create a new Xls Reader
$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
$reader->setReadDataOnly(true);

$peserta = array();
$ambil = $koneksi->query("SELECT * FROM peserta LEFT JOIN siswa ON peserta.nis = siswa.nis WHERE id_kelas = '$id_kelas'");
while ($tiap = $ambil->fetch_assoc()) {
    $peserta[] = $tiap;
}
?>

<div class="container my-5">
    <div class="card">
        <div class="card-body">
            <h5>Daftar Peserta</h5>
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>NIS</th>
                        <th>Nama</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($peserta as $key => $value) { ?>
                        <tr>
                            <td><?php echo $key + 1 ?></td>
                            <td><?php echo $value['nis'] ?></td>
                            <td><?php echo $value['nama_siswa'] ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container my-5">
    <div class="card">
        <div class="card-body">
            <h5>Import Peserta</h5>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="file">File Excel Peserta</label>
                    <input type="file" name="file" id="" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary" name="kirim">Kirim</button>
            </form>
        </div>
    </div>
</div>

<?php
if (isset($_POST['kirim'])) {
    if (isset($_FILES['file']['tmp_name']) && $_FILES['file']['tmp_name'] !== '') {
        $spreadsheet = $reader->load($_FILES['file']['tmp_name']);
        $sheet = $spreadsheet->getSheet($spreadsheet->getFirstSheetIndex());
        $data = $sheet->toArray();

        foreach ($data as $key => $persiswa) {
            $nis = $koneksi->real_escape_string($persiswa[0]);
            $nama = $koneksi->real_escape_string($persiswa[1]);
            $psw = $koneksi->real_escape_string(sha1($nis));
            $foto = "default.jpg";

            // siswa
            $ambil = $koneksi->query("SELECT * FROM siswa WHERE nis = '$nis'");
            if ($ambil) {
                $ceksiswa = $ambil->fetch_assoc();
                if (empty($ceksiswa)) {
                    $koneksi->query("INSERT INTO siswa(nis, nama_siswa, password_siswa, foto_siswa) VALUES ('$nis', '$nama', '$psw', '$foto')");
                }
            } else {
                echo "Error: " . $koneksi->error;
            }

            // peserta
            $ambil = $koneksi->query("SELECT * FROM peserta WHERE nis = '$nis' AND id_kelas='$id_kelas'");
            if ($ambil) {
                $cekpeserta = $ambil->fetch_assoc();
                if (empty($cekpeserta)) {
                    $koneksi->query("INSERT INTO peserta(nis, id_kelas) VALUES ('$nis', '$id_kelas')");
                }
            } else {
                echo "Error: " . $koneksi->error;
            }
        }

        echo "<script>alert('Data siswa terimport')</script>";
        header("Location: peserta.php?id_kelas=$id_kelas");
        exit;
    } else {
        echo "File tidak ditemukan atau format file salah!";
    }
}
?>

<?php include 'footer.php'; ?>