class Laporan {
  final String title;
  final DateTime tanggal;
  final String status;
  final String instansi;
  final String deskripsi;
  final String komentar;
  final String gambar;

  Laporan({
    required this.title,
    required this.tanggal,
    required this.instansi,
    this.status = 'Posted',
    this.deskripsi = '',
    this.komentar = '',
    this.gambar = '',
  });
}
