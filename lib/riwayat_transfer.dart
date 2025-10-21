import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transfer_provider.dart';
import 'package:intl/intl.dart';

class RiwayatTransferPage extends StatelessWidget {
  const RiwayatTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final riwayat = context.watch<TransferProvider>().riwayat;
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final dateFmt = DateFormat('dd MMM yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Transfer"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: riwayat.isEmpty
          ? const Center(child: Text("Belum ada riwayat transfer", style: TextStyle(color: Colors.black54)))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: riwayat.length,
              itemBuilder: (context, i) {
                final item = riwayat[i];
                final tanggal = dateFmt.format(item.tanggal);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.subdirectory_arrow_left, color: Colors.orange),
                    title: Text(item.namaPenerima, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text("$tanggal\nRek: ${item.rekTujuan}\n${item.keterangan.isEmpty ? '-' : item.keterangan}"),
                    trailing: Text(formatter.format(item.nominal), style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
    );
  }
}
