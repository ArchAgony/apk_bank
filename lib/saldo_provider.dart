import 'package:flutter/material.dart';

class SaldoProvider extends ChangeNotifier {
  int _saldo = 100000; // saldo awal

  int get saldo => _saldo;

  void tambahSaldo(int nominal) {
    _saldo += nominal;
    notifyListeners();
  }

  void kurangiSaldo(int nominal) {
    if (nominal <= _saldo) {
      _saldo -= nominal;
      notifyListeners();
    }
  }
}
