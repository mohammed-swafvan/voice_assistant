import 'package:allen/presentation/widgets/virtual_assistant_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Allen"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: const Column(
        children: [
          VirtualAssistanWidget(),
        ],
      ),
    );
  }
}
