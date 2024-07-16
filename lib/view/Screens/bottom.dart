import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/state_management/bottom_provider.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomProvider>();
    return Scaffold(
      body: provider.pages[provider.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_calendar_outlined),
              label: "Samples"
          ),
        ],
        onTap: provider.krish,
        currentIndex: provider.currentindex,
      ),

    );
  }
}
