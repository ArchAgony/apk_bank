import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'saldo_provider.dart';
import 'transfer_provider.dart';
import 'beranda.dart';
import 'riwayat_transfer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SaldoProvider()),
        ChangeNotifierProvider(create: (_) => TransferProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Bank',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
      routes: {
        '/riwayat': (_) => const RiwayatTransferPage(),
      },
    );
  }
}
