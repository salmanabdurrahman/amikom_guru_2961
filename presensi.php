<?php
include 'koneksi.php';
include 'header.php';

$id_sesi = $_GET["id_sesi"];
?>

<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card border-0 shadow-sm">
                    <div class="card-body letak-qrcode">

                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6>Mahasiswa</h6>
                        <table class="table table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>NIS</th>
                                    <th>Nama</th>
                                    <th>Waktu</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>X</td>
                                    <td>X</td>
                                    <td>X</td>
                                    <td>X</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>

<script>
    function presensi_qr() {
        $.ajax({
            type: "get",
            url: "presensi_qr.php?id_sesi=<?php echo $id_sesi ?>",
            success: function (hasil_qr) {
                $(".letak-qrcode").html(hasil_qr);
            }
        });
    }

    presensi_qr();

    setInterval(function () {
        presensi_qr();
    }, 5000);
</script>