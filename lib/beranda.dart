import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'saldo_provider.dart';
import 'isi_saldo.dart';
import 'transfer.dart';
import 'riwayat_transfer.dart';
import 'informasi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final saldo = context.watch<SaldoProvider>().saldo; // ✅ saldo global

    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.send,
        "label": "Transfer",
        "color": Colors.teal,
        "builder": (BuildContext context) => const TransferPage(),
      },
      {
        "icon": Icons.account_balance_wallet,
        "label": "Cek Saldo",
        "color": Colors.blue,
        "builder": null,
      },
      {
        "icon": Icons.payment,
        "label": "Pembayaran",
        "color": Colors.purple,
        "builder": null,
      },
      {
        "icon": Icons.add_card,
        "label": "Isi Saldo",
        "color": Colors.indigo,
        "builder": (BuildContext context) => const IsiSaldoPage(),
      },
      {
        "icon": Icons.history,
        "label": "Riwayat",
        "color": Colors.green,
        "builder": (BuildContext context) => const RiwayatTransferPage(),
      },
      {
        "icon": Icons.info,
        "label": "Informasi",
        "color": Colors.cyan,
        "builder": (BuildContext context) => InformasiTimPage(),
      },
      {
        "icon": Icons.settings,
        "label": "Pengaturan",
        "color": Colors.yellow,
        "builder": null,
      },
      {
        "icon": Icons.more_horiz,
        "label": "Lainnya",
        "color": Colors.orange,
        "builder": null,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              "BRN",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.wifi, color: Colors.orange),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.logout, color: Colors.orange),
          ),
        ],
      ),
      body: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(Icons.person, color: Colors.black),
            ),
            title: Text("Selamat Datang,"),
            subtitle: Text("Vera"),
          ),
          // saldo utama
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Saldo Utama", style: TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 4),
                Text(
                  "Rp $saldo",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text("123456789", style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          // grid menu
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final m = menuItems[index];

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      final builder = m['builder'] as WidgetBuilder?;
                      if (builder == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fitur belum tersedia')),
                        );
                        return;
                      }
                      Navigator.of(context).push(MaterialPageRoute(builder: builder));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: m["color"] as Color,
                          child: Icon(m["icon"] as IconData, color: Colors.white),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          m["label"] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.orange,
            padding: const EdgeInsets.all(12),
            child: const Center(
              child: Text(
                "Tim Mencari Cinta Sejati",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
