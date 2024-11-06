import 'package:flutter/material.dart';

import '../services/admin_service.dart';
import 'formulario.dart';

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
    notes = await AdminService().getNotes();
    setState(() {});
  }
  colorGet (String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'grey':
        return Colors.grey;
      case 'orange':
        return Colors.orange;
      default:
        return Colors.white;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: notesGet,
                child: const Text('Actualizar')
              ),
            ],
          ),
          for (var note in notes)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: colorGet(note['color']),
                textColor: Colors.white,
                title: Text(note['title']),
                subtitle: Text(note['content']),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Formulario()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
