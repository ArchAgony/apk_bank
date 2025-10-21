import 'package:flutter/material.dart';

class TransferItem {
  final DateTime tanggal;
  final String namaPenerima;
  final String rekTujuan;
  final int nominal;
  final String keterangan;

  TransferItem({
    required this.tanggal,
    required this.namaPenerima,
    required this.rekTujuan,
    required this.nominal,
    required this.keterangan,
  });
}

class TransferProvider extends ChangeNotifier {
  final List<TransferItem> _riwayat = [];

  List<TransferItem> get riwayat => List.unmodifiable(_riwayat);

  void tambahRiwayat(TransferItem item) {
    _riwayat.insert(0, item); // terbaru di depan
    notifyListeners();
  }
}
