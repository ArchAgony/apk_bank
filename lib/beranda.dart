import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.send, "label": "Transfer", "color": Colors.teal},
    {"icon": Icons.account_balance_wallet, "label": "Cek Saldo", "color": Colors.blue},
    {"icon": Icons.payment, "label": "Pembayaran", "color": Colors.purple},
    {"icon": Icons.add_card, "label": "Isi Saldo", "color": Colors.indigo},
    {"icon": Icons.history, "label": "Riwayat", "color": Colors.green},
    {"icon": Icons.info, "label": "Informasi", "color": Colors.cyan},
    {"icon": Icons.settings, "label": "Pengaturan", "color": Colors.yellow.shade700},
    {"icon": Icons.more_horiz, "label": "Lainnya", "color": Colors.orange},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "BRN",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.wifi, color: Colors.orange),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Saldo Utama",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                SizedBox(height: 4),
                Text("Rp 123.456",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("123456789",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
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
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: menuItems[index]["color"],
                      child: Icon(
                        menuItems[index]["icon"],
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      menuItems[index]["label"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
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
          )
        ],
      ),
    );
  }
}
