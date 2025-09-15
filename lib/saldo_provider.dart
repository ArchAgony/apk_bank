import 'package:flutter/material.dart';

class SaldoProvider extends ChangeNotifier {
  int _saldo = 123456; // saldo awal

  int get saldo => _saldo;

  void tambahSaldo(int nominal) {
    _saldo += nominal;
    notifyListeners(); // kasih tahu UI kalau saldo berubah
  }
}
