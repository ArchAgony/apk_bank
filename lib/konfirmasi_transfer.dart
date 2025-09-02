import 'package:flutter/material.dart';

// void main() => runApp(const KonfirmasiTransfer());

class KonfirmasiTransfer extends StatelessWidget {
  const KonfirmasiTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransferPage(),
    );
  }
}

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

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
            const SizedBox(height: 16),
            const Text(
              "Konfirmasi Kembali",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: greenDark,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black.withOpacity(.15), width: 1),
              ),
              child: const Text(
                "Rp 5.000.000",
                style: TextStyle(
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildRow("Tanggal Transaksi", "20-09-2300"),
                    _buildRow("Jenis Transaksi", "Transfer"),
                    _buildRow("Nama Pengirim", "Vera"),
                    _buildRow("No. Rekening Pengirim", "12345678"),
                    const Divider(),
                    _buildRow("Nama Penerima", "Rekayasa"),
                    _buildRow("No.Rekening Tujuan", "12345678"),
                    _buildRow("Nominal Transfer", "Rp.123.456"),
                    _buildRow("Berita", "Uang Bensin"),
                    _buildRow("Biaya Admin", "Rp 2.500"),
                    const SizedBox(height: 10),
                    // Total (baris dengan background hijau tua)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: greenDark,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Total",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Rp 50.000.000",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Tombol Transfer DI DALAM CARD & kecil (seukuran teks)
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 13),
                          shape: const StadiumBorder(),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Transfer",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
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
          Text(
            left,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            right,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
