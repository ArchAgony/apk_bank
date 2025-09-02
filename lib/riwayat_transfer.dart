import 'package:flutter/material.dart';

// void main() => runApp(const RiwayatTransfer());

class RiwayatTransfer extends StatelessWidget {
  const RiwayatTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiwayatTransferPage(),
    );
  }
}

class RiwayatTransferPage extends StatelessWidget {
  const RiwayatTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Riwayat Transfer"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
            child: Column(
              children: [
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: const BorderRadius.vertical(
                //       top: Radius.circular(8),
                //     ),
                //   ),
                //   child: const Center(
                //     child: Text(
                //       "Riwayat",
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                // ),
                // const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "06 Juni 3487",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildItem(),
                      _buildItem(),
                      _buildItem(),
                      const SizedBox(height: 12),
                      const Text(
                        "06 Juni 3487",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildItem(),
                      _buildItem(),
                      _buildItem(),
                      _buildItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.subdirectory_arrow_left,
            color: Colors.orange,
            size: 28,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Transfer Rupiah",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 2),
                Text(
                  "Transfer BI Fast\nDari BANK PERMATA\nSHEILA NATASHA 123789",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          const Text(
            "+ Rp 16.000.000",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
