import 'package:flutter/material.dart';
import 'package:tenders_app/features/tenders/presentation/screens/tender_list/tenders_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tenders in Poland'),
        elevation: 0,
      ),
      body: const TendersScreen(),
    );
  }
}
