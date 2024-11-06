import 'package:flutter/material.dart';

import '../services/admin_service.dart';

class Formulario extends StatefulWidget {
  final String? title;
  final String? content;
  final int? id;
  const Formulario({
    super.key,
    this.title,
    this.content,
    this.id,
  });

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title ?? '';
    contentController.text = widget.content ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (widget.id != null) {
                await AdminService().putNotes(
                  widget.id!,
                  titleController.text,
                  contentController.text,
                );
              } else {
                await AdminService().postNotes(
                  titleController.text,
                  contentController.text,
                );
              }
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
