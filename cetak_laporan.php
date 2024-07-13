<?php
session_start();
require('config/database.php');
require('template/plugins/fpdf/fpdf.php');

include('component/com-laporan.php');

function getNama($file, $id)
{
  if (!file_exists($file)) return '-';
  $jsonString = file_get_contents($file);
  $jsonDecode = json_decode($jsonString, true);
  $nama = '';
  foreach ($jsonDecode as $data) {
    if ($data['id'] == $id) {
      $nama = $data['nama'];
      break;
    }
  }
  return $nama;
}

if ($_GET['module'] == "laporan/transaksi") {
  $pdf = new FPDF('P', 'mm', 'A4');
  $pdf->AddPage();

  $width = $pdf->GetPageWidth() - $pdf->GetX() * 2;

  $pdf->SetFont('Times', 'B', 20);
  $pdf->Cell($width, 10, 'PRINGOMBO HOMESTAY', 0, 0, 'C');
  $pdf->Cell(10, 14, '', 0, 1);
  $pdf->SetFont('Times', 'B', 13);
  $pdf->Cell($width, 10, 'LAPORAN PENDAPATAN', 0, 1, 'C');
  $pdf->SetFont('Times', '', 11);
  $pdf->Cell($width, 6, 'Tanggal: ' . formatTanggal($tanggal_start) . ' - ' . formatTanggal($tanggal_end), 0, 0, 'C');

  $pdf->Cell(10, 12, '', 0, 1);

  $pdf->SetFont('Times', 'B', 10);
  $pdf->Cell(10, 7, 'NO', 1, 0, 'C');
  $pdf->Cell(50, 7, 'TANGGAL', 1, 0, 'C');
  $pdf->Cell(75, 7, 'NOMOR INVOICE', 1, 0, 'C');
  $pdf->Cell(55, 7, 'TOTAL BIAYA', 1, 0, 'C');

  $pdf->Cell(10, 7, '', 0, 1);
  $pdf->SetFont('Times', '', 10);
  $no = 1;

  foreach ($laporan_transaksi as $data) {
    $pdf->Cell(10, 6, $no++, 1, 0, 'C');
    $pdf->Cell(50, 6, formatTanggal($data['tanggal']), 1, 0, 'C');
    $pdf->Cell(75, 6, $data['nomor_invoice'], 1, 0);
    $pdf->Cell(55, 6, formatRupiah($data['total_biaya_kamar']), 1, 1, 'R');
  }
  $pdf->SetFont('Times', 'B', 10);
  $pdf->Cell(135, 6, 'Total Pendapatan', 1, 0, 'R');
  $pdf->Cell(55, 6, formatRupiah($total_laporan_transaksi), 1, 1, 'R');

  $pdf->Cell(10, 7, '', 0, 1);
  $pdf->SetFont('Times', '', 11);
  $pdf->Cell($width - 50, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Pringsewu, ' . date("t-m-Y"), 0, 1, 'L');
  $pdf->Cell(50, 7, 'Pegawai', 0, 0, 'L');
  $pdf->Cell($width - 100, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Mengetahui', 0, 1, 'L');
  $pdf->Cell(10, 14, '', 0, 1);
  $pdf->Cell(50, 7, $_SESSION['nama'], 0, 0, 'L');
  $pdf->Cell($width - 100, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Pimpinan', 0, 1, 'L');

  $pdf->Output();
}

if ($_GET['module'] == "laporan/checkout") {
  $pdf = new FPDF('L', 'mm', 'A4');
  $pdf->AddPage();

  $width = $pdf->GetPageWidth() - $pdf->GetX() * 2;

  $pdf->SetFont('Times', 'B', 20);
  $pdf->Cell($width, 10, 'PRINGOMBO HOMESTAY', 0, 0, 'C');
  $pdf->Cell(10, 14, '', 0, 1);
  $pdf->SetFont('Times', 'B', 13);
  $pdf->Cell($width, 10, 'LAPORAN CHECK IN/OUT', 0, 1, 'C');
  $pdf->SetFont('Times', '', 11);
  $pdf->Cell($width, 6, 'Tanggal: ' . formatTanggal($tanggal_start) . ' - ' . formatTanggal($tanggal_end), 0, 0, 'C');

  $pdf->Cell(10, 12, '', 0, 1);

  $pdf->SetFont('Times', 'B', 10);
  $pdf->Cell(10, 7, 'NO', 1, 0, 'C');
  $pdf->Cell(40, 7, 'NOMOR INVOICE', 1, 0, 'C');
  $pdf->Cell(50, 7, 'NAMA TAMU', 1, 0, 'C');
  $pdf->Cell(30, 7, 'TIPE KAMAR', 1, 0, 'C');
  $pdf->Cell(45, 7, 'TANGGAL CHECK IN', 1, 0, 'C');
  $pdf->Cell(45, 7, 'TANGGAL CHECK OUT', 1, 0, 'C');
  $pdf->Cell(35, 7, 'TOTAL BIAYA', 1, 0, 'C');
  $pdf->Cell(25, 7, 'STATUS', 1, 0, 'C');


  $pdf->Cell(10, 7, '', 0, 1);
  $pdf->SetFont('Times', '', 10);
  $no = 1;

  foreach ($laporan_checkout as $data) {
    $pdf->Cell(10, 6, $no++, 1, 0, 'C');
    $pdf->Cell(40, 6, $data['nomor_invoice'], 1, 0);
    $pdf->Cell(50, 6, $data['nama_depan'] . ' ' . $data['nama_belakang'], 1, 0);
    $pdf->Cell(30, 6, $data['nama_kamar_tipe'], 1, 0);
    $pdf->Cell(45, 6, formatTanggal($data['tanggal_checkin']) . ' ' . $data['waktu_checkin'], 1, 0, 'C');
    $pdf->Cell(45, 6, formatTanggal($data['tanggal_checkout']) . ' ' . $data['waktu_checkout'], 1, 0, 'C');
    $pdf->Cell(35, 6, formatRupiah($data['total_biaya_kamar']), 1, 0, 'R');
    $pdf->Cell(25, 6, $data['status'], 1, 1, 'C');
  }
  $pdf->SetFont('Times', 'B', 10);
  $pdf->Cell(220, 6, 'Total Pendapatan', 1, 0, 'R');
  $pdf->Cell(35, 6, formatRupiah($total_laporan_checkout), 1, 0, 'R');
  $pdf->Cell(25, 6, '', 1, 1);

  $pdf->Cell(10, 7, '', 0, 1);
  $pdf->SetFont('Times', '', 11);
  $pdf->Cell($width - 50, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Pringsewu, ' . date("t-m-Y"), 0, 1, 'L');
  $pdf->Cell(50, 7, 'Pegawai', 0, 0, 'L');
  $pdf->Cell($width - 100, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Mengetahui', 0, 1, 'L');
  $pdf->Cell(10, 14, '', 0, 1);
  $pdf->Cell(50, 7, $_SESSION['nama'], 0, 0, 'L');
  $pdf->Cell($width - 100, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Pimpinan', 0, 1, 'L');

  $pdf->Output();
}

if ($_GET['module'] == "laporan/buku-tamu") {
  $pdf = new FPDF('L', 'mm', 'A4');
  $pdf->AddPage();

  $width = $pdf->GetPageWidth() - $pdf->GetX() * 2;

  $pdf->SetFont('Times', 'B', 20);
  $pdf->Cell($width, 10, 'PRINGOMBO HOMESTAY', 0, 0, 'C');
  $pdf->Cell(10, 14, '', 0, 1);
  $pdf->SetFont('Times', 'B', 13);
  $pdf->Cell($width, 10, 'LAPORAN BUKU TAMU', 0, 1, 'C');

  $pdf->Cell(10, 12, '', 0, 1);

  $pdf->SetFont('Times', 'B', 10);
  $pdf->Cell(10, 7, 'NO', 1, 0, 'C');
  $pdf->Cell(50, 7, 'NAMA TAMU', 1, 0, 'C');
  $pdf->Cell(40, 7, 'JENIS KELAMIN', 1, 0, 'C');
  $pdf->Cell(25, 7, 'IDENTITAS', 1, 0, 'C');
  $pdf->Cell(45, 7, 'NOMOR IDENTITAS', 1, 0, 'C');
  $pdf->Cell(75, 7, 'ALAMAT', 1, 0, 'C');
  $pdf->Cell(30, 7, 'NOMOR HP', 1, 0, 'C');


  $pdf->Cell(10, 7, '', 0, 1);
  $pdf->SetFont('Times', '', 10);
  $no = 1;

  foreach ($laporan_bukutamu as $data) {
    $alamat = $data['alamat_jalan'];
    if ($data['warga_negara'] == "WNI") {
      $nama_provinsi = getNama('template/plugins/data-indonesia/provinsi.json', $data['alamat_provinsi']);
      $nama_kabupaten = getNama('template/plugins/data-indonesia/kabupaten/' . $data['alamat_provinsi'] . '.json', $data['alamat_kabupaten']);
      $alamat = $nama_kabupaten . ', ' . $nama_provinsi;
    }

    $pdf->Cell(10, 6, $no++, 1, 0, 'C');
    $pdf->Cell(50, 6, $data['nama_depan'] . ' ' . $data['nama_belakang'], 1, 0);
    $pdf->Cell(40, 6, $data['prefix'] == 'Mr' ? 'Laki-Laki' : 'Perempuan', 1, 0, 'C');
    $pdf->Cell(25, 6, $data['tipe_identitas'], 1, 0, 'C');
    $pdf->Cell(45, 6, $data['nomor_identitas'], 1, 0);
    $pdf->Cell(75, 6, $alamat, 1, 0);
    $pdf->Cell(30, 6, $data['nomor_telp'], 1, 1);
  }

  $pdf->Cell(10, 7, '', 0, 1);
  $pdf->SetFont('Times', '', 11);
  $pdf->Cell($width - 50, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Pringsewu, ' . date("t-m-Y"), 0, 1, 'L');
  $pdf->Cell(50, 7, 'Pegawai', 0, 0, 'L');
  $pdf->Cell($width - 100, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Mengetahui', 0, 1, 'L');
  $pdf->Cell(10, 14, '', 0, 1);
  $pdf->Cell(50, 7, $_SESSION['nama'], 0, 0, 'L');
  $pdf->Cell($width - 100, 7, '', 0, 0);
  $pdf->Cell(50, 6, 'Pimpinan', 0, 1, 'L');

  $pdf->Output();
}
