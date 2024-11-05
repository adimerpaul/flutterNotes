import 'package:flutter/material.dart';

import '../services/admin_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [];
  @override
  void initState() {
    super.initState();
    notesGet();
  }
  notesGet() async {
    // Get notes from database
    notes = await AdminService().getNotes();
    print(notes);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
