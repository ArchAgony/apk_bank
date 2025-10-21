import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'saldo_provider.dart';
import 'transfer_provider.dart';
import 'transfer_berhasil.dart';

class KonfirmasiTransfer extends StatelessWidget {
  final String rekTujuan;
  final String namaPenerima;
  final int nominal;
  final String keterangan;

  const KonfirmasiTransfer({
    super.key,
    required this.rekTujuan,
    required this.namaPenerima,
    required this.nominal,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    final saldoProvider = Provider.of<SaldoProvider>(context, listen: false);
    final transferProvider = Provider.of<TransferProvider>(context, listen: false);
    final Color greenDark = Colors.teal[800]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi Transfer"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text("Konfirmasi Kembali", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: greenDark, borderRadius: BorderRadius.circular(24)),
              child: Text("Rp $nominal", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildRow("Nama Penerima", namaPenerima),
                    _buildRow("Rek Tujuan", rekTujuan),
                    _buildRow("Nominal Transfer", "Rp $nominal"),
                    _buildRow("Berita", keterangan.isEmpty ? "-" : keterangan),
                    const Divider(),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          // cek saldo dulu
                          if (nominal <= saldoProvider.saldo) {
                            // kurangi saldo
                            saldoProvider.kurangiSaldo(nominal);

                            // simpan riwayat transfer di TransferProvider
                            transferProvider.tambahRiwayat(
                              TransferItem(
                                tanggal: DateTime.now(),
                                namaPenerima: namaPenerima,
                                rekTujuan: rekTujuan,
                                nominal: nominal,
                                keterangan: keterangan,
                              ),
                            );

                            // pindah ke halaman sukses
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TransferSuccessPage(
                                  rekTujuan: rekTujuan,
                                  namaPenerima: namaPenerima,
                                  nominal: nominal,
                                  keterangan: keterangan,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Saldo tidak cukup')),
                            );
                          }
                        },
                        child: const Text("Transfer", style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600)),
          Text(right, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
