import 'package:flutter/material.dart';

// void main() {
//   runApp(const Transfer());
// }

class Transfer extends StatelessWidget {
  const Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transfer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F8A8A)),
        useMaterial3: true,
      ),
      home: const TransferPage(),
    );
  }
}

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();

  final _rekTujuanC = TextEditingController();
  final _namaPenerimaC = TextEditingController();
  final _nominalC = TextEditingController();
  final _keteranganC = TextEditingController();

  @override
  void dispose() {
    _rekTujuanC.dispose();
    _namaPenerimaC.dispose();
    _nominalC.dispose();
    _keteranganC.dispose();
    super.dispose();
  }

  InputDecoration _input(String hint) {
    return InputDecoration(
      hintText: hint,
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Transfer'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.4,
      ),
      bottomNavigationBar: Container(
        height: 42,
        color: Colors.orange, // kuning-oranye
        alignment: Alignment.center,
        child: const Text(
          'Tim Mencari Cinta Sejati',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Kartu info akun
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F8A8A), // teal
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '12345678',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Vera',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Saldo Anda:',
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Rp 123.456',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Field input
                TextFormField(
                  controller: _rekTujuanC,
                  keyboardType: TextInputType.number,
                  decoration: _input('Masukkan No. Rekening Tujuan'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Rekening tujuan wajib diisi' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _namaPenerimaC,
                  textCapitalization: TextCapitalization.words,
                  decoration: _input('Masukkan Nama Penerima'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Nama penerima wajib diisi' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nominalC,
                  keyboardType: TextInputType.number,
                  decoration: _input('Masukkan Nominal Transfer'),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Nominal wajib diisi';
                    final value = int.tryParse(v.replaceAll('.', '').replaceAll(',', ''));
                    if (value == null || value <= 0) return 'Nominal tidak valid';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _keteranganC,
                  decoration: _input('Masukkan Keterangan'),
                ),

                const SizedBox(height: 18),

                // Tombol aksi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _formKey.currentState?.reset();
                        _rekTujuanC.clear();
                        _namaPenerimaC.clear();
                        _nominalC.clear();
                        _keteranganC.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form dibersihkan')),
                        );
                      },
                      child: const Text('Batal'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Simulasi lanjut/konfirmasi
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Konfirmasi'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rek Tujuan: ${_rekTujuanC.text}'),
                                  Text('Nama: ${_namaPenerimaC.text}'),
                                  Text('Nominal: ${_nominalC.text}'),
                                  Text('Ket: ${_keteranganC.text.isEmpty ? "-" : _keteranganC.text}'),
                                ],
                              ),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup')),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Lanjut'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}