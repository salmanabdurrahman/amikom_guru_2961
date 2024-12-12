<?php
include 'koneksi.php';

use chillerlan\QRCode\QRCode;
use chillerlan\QRCode\Data\QRMatrix;
use chillerlan\QRCode\Output\QRMarkupHTML;

require_once 'vendor/autoload.php';

$kode = generateRandomString(5);
$out = (new QRCode())->render($kode);

$id_sesi = $_GET["id_sesi"];
$koneksi->query("UPDATE sesi set kode_sesi = '$kode' WHERE id_sesi = '$id_sesi' ");
?>

<img src="<?php echo $out ?>" alt="" class="img-fluid">
<h5 class="text-center"><?php echo $kode ?></h5>