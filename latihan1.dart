import 'dart:io';

class Pegawai {
  int nip;
  String nama;
  String alamat;
  String golongan;

  Pegawai({
    required this.nip,
    required this.nama,
    required this.alamat,
    required this.golongan,
  });
}

// Sequential Search
int sequentialSearch(List<Pegawai> data, dynamic kunci, bool byNip) {
  int perbandingan = 0;
  for (int i = 0; i < data.length; i++) {
    perbandingan++;
    if ((byNip && data[i].nip == kunci) || (!byNip && data[i].nama == kunci)) {
      print("\n✅ Data ditemukan:");
      print("NIP     : ${data[i].nip}");
      print("Nama    : ${data[i].nama}");
      print("Alamat  : ${data[i].alamat}");
      print("Golongan: ${data[i].golongan}");
      print("Jumlah perbandingan: $perbandingan");
      return i;
    }
  }
  print("\n❌ Data tidak ditemukan.");
  print("Jumlah perbandingan: $perbandingan");
  return -1;
}

// Binary Search
int binarySearch(List<Pegawai> data, dynamic kunci, bool byNip) {
  int low = 0, high = data.length - 1;
  int perbandingan = 0;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    perbandingan++;

    if ((byNip && data[mid].nip == kunci) || (!byNip && data[mid].nama == kunci)) {
      print("\n✅ Data ditemukan:");
      print("NIP     : ${data[mid].nip}");
      print("Nama    : ${data[mid].nama}");
      print("Alamat  : ${data[mid].alamat}");
      print("Golongan: ${data[mid].golongan}");
      print("Jumlah perbandingan: $perbandingan");
      return mid;
    } else if ((byNip && kunci < data[mid].nip) || (!byNip && kunci.compareTo(data[mid].nama) < 0)) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  print("\n❌ Data tidak ditemukan.");
  print("Jumlah perbandingan: $perbandingan");
  return -1;
}

void main() {
  List<Pegawai> pegawaiList = [];

  stdout.write("Masukkan jumlah pegawai: ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print("\nData pegawai ke-${i + 1}:");
    stdout.write("NIP: ");
    int nip = int.parse(stdin.readLineSync()!);
    stdout.write("Nama: ");
    String nama = stdin.readLineSync()!;
    stdout.write("Alamat: ");
    String alamat = stdin.readLineSync()!;
    stdout.write("Golongan: ");
    String gol = stdin.readLineSync()!;

    pegawaiList.add(Pegawai(nip: nip, nama: nama, alamat: alamat, golongan: gol));
  }

  print("\n=== PILIH METODE PENCARIAN ===");
  print("1. Sequential Search");
  print("2. Binary Search");
  stdout.write("Pilihan: ");
  int metode = int.parse(stdin.readLineSync()!);

  print("\n=== PILIH KUNCI PENCARIAN ===");
  print("1. Berdasarkan NIP");
  print("2. Berdasarkan Nama");
  stdout.write("Pilihan: ");
  int kunciPilihan = int.parse(stdin.readLineSync()!);
  bool byNip = kunciPilihan == 1;

  dynamic kunci;
  if (byNip) {
    stdout.write("Masukkan NIP yang dicari: ");
    kunci = int.parse(stdin.readLineSync()!);
  } else {
    stdout.write("Masukkan Nama yang dicari: ");
    kunci = stdin.readLineSync()!;
  }

  // Urutkan jika pakai binary search
  if (metode == 2) {
    if (byNip) {
      pegawaiList.sort((a, b) => a.nip.compareTo(b.nip));
    } else {
      pegawaiList.sort((a, b) => a.nama.compareTo(b.nama));
    }
  }

  // Jalankan metode pencarian
  if (metode == 1) {
    sequentialSearch(pegawaiList, kunci, byNip);
  } else {
    binarySearch(pegawaiList, kunci, byNip);
  }
}
