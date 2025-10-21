import 'package:flutter/material.dart';

class TransferSuccessPage extends StatelessWidget {
  final String rekTujuan;
  final String namaPenerima;
  final int nominal;
  final String keterangan;

  const TransferSuccessPage({
    super.key,
    required this.rekTujuan,
    required this.namaPenerima,
    required this.nominal,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    final Color greenDark = Colors.teal[800]!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 12),
            const Text(
              "Transfer Berhasil",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: greenDark,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                "Rp $nominal",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildRow("Jenis Transaksi", "Transfer"),
                    _buildRow("Nama Penerima", namaPenerima),
                    _buildRow("Rek Tujuan", rekTujuan),
                    _buildRow("Nominal Transfer", "Rp $nominal"),
                    _buildRow("Keterangan", keterangan.isEmpty ? "-" : keterangan),
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
          Text(left,
              style: const TextStyle(
                  color: Colors.teal, fontWeight: FontWeight.w600)),
          Text(right, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
