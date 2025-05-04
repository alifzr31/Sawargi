// To parse this JSON data, do
//
//     final anggotaKependudukan = anggotaKependudukanFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

AnggotaKependudukan anggotaKependudukanFromJson(dynamic data) =>
    AnggotaKependudukan.fromJson(data);

String anggotaKependudukanToJson(AnggotaKependudukan data) =>
    json.encode(data.toJson());

class AnggotaKependudukan extends Equatable {
  final String? nik;
  final String? nomorKk;
  final String? nama;
  final String? alamat;
  final String? tempatLahir;
  final DateTime? tanggalLahir;
  final String? namaAyah;
  final String? namaIbu;
  final String? yatimPiatu;
  final String? jenisKelamin;
  final String? agama;
  final String? pendidikan;
  final String? pekerjaan;
  final String? statusPernikahan;
  final String? statusHubungan;
  final String? kewarganegaraan;
  final String? golonganDarah;
  final int? periodeAwal;
  final int? periodeAkhir;

  const AnggotaKependudukan({
    this.nik,
    this.nomorKk,
    this.nama,
    this.alamat,
    this.tempatLahir,
    this.tanggalLahir,
    this.namaAyah,
    this.namaIbu,
    this.yatimPiatu,
    this.jenisKelamin,
    this.agama,
    this.pendidikan,
    this.pekerjaan,
    this.statusPernikahan,
    this.statusHubungan,
    this.kewarganegaraan,
    this.golonganDarah,
    this.periodeAwal,
    this.periodeAkhir,
  });

  @override
  List<Object?> get props => [
    nik,
    nomorKk,
    nama,
    alamat,
    tempatLahir,
    tanggalLahir,
    namaAyah,
    namaIbu,
    yatimPiatu,
    jenisKelamin,
    agama,
    pendidikan,
    pekerjaan,
    statusPernikahan,
    statusHubungan,
    kewarganegaraan,
    golonganDarah,
    periodeAwal,
    periodeAkhir,
  ];

  factory AnggotaKependudukan.fromJson(Map<String, dynamic> json) =>
      AnggotaKependudukan(
        nik: json["nik"],
        nomorKk: json["nomor_kk"],
        nama: json["nama"],
        alamat: json["alamat"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir:
            json["tanggal_lahir"] == null
                ? null
                : DateTime.parse(json["tanggal_lahir"]),
        namaAyah: json["nama_ayah"],
        namaIbu: json["nama_ibu"],
        yatimPiatu: json["yatim_piatu"],
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        pendidikan: json["pendidikan"],
        pekerjaan: json["pekerjaan"],
        statusPernikahan: json["status_pernikahan"],
        statusHubungan: json["status_hubungan"],
        kewarganegaraan: json["kewarganegaraan"],
        golonganDarah: json["golongan_darah"],
        periodeAwal: json["periode_awal"],
        periodeAkhir: json["periode_akhir"],
      );

  Map<String, dynamic> toJson() => {
    "nik": nik,
    "nomor_kk": nomorKk,
    "nama": nama,
    "alamat": alamat,
    "tempat_lahir": tempatLahir,
    "tanggal_lahir": tanggalLahir?.toIso8601String(),
    "nama_ayah": namaAyah,
    "nama_ibu": namaIbu,
    "yatim_piatu": yatimPiatu,
    "jenis_kelamin": jenisKelamin,
    "agama": agama,
    "pendidikan": pendidikan,
    "pekerjaan": pekerjaan,
    "status_pernikahan": statusPernikahan,
    "status_hubungan": statusHubungan,
    "kewarganegaraan": kewarganegaraan,
    "golongan_darah": golonganDarah,
    "periode_awal": periodeAwal,
    "periode_akhir": periodeAkhir,
  };
}
