import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'saldo_provider.dart';

class IsiSaldoPage extends StatefulWidget {
  const IsiSaldoPage({super.key});

  @override
  State<IsiSaldoPage> createState() => _IsiSaldoPageState();
}

class _IsiSaldoPageState extends State<IsiSaldoPage> {
  final TextEditingController nominalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Isi Saldo"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.teal[800]!, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: nominalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Nominal",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Batal"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  ),
                  onPressed: () {
                    final nominal = int.tryParse(nominalController.text) ?? 0;
                    if (nominal > 0) {
                      // Tambah saldo
                      context.read<SaldoProvider>().tambahSaldo(nominal);

                      // Tampilkan alert sukses
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Berhasil"),
                          content: Text("Saldo berhasil diisi Rp $nominal"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // tutup alert
                                Navigator.pop(context); // kembali ke beranda
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text("Isi Sekarang"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
