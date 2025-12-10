import 'package:flutter/material.dart';
import 'package:coach_nutrition/Profile/ProfileField.dart';

class ModifierProfilePage extends StatefulWidget {
  final List<ProfileField> fields;

  const ModifierProfilePage({required this.fields, super.key});

  @override
  State<ModifierProfilePage> createState() => _ModifierProfilePageState();
}

class _ModifierProfilePageState extends State<ModifierProfilePage> {
  late List<TextEditingController> controllers;
  @override
  void initState() {
    super.initState();
    controllers = widget.fields.map((f) {
      if (f.type == FieldType.date) {
        return TextEditingController(
          text: (f.value as DateTime).toLocal().toString().split(' ')[0],
        );
      }
      return TextEditingController(text: f.value.toString());
    }).toList();
  }
  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }
  Future<void> _pickDate(int index) async {
    DateTime initial = widget.fields[index].value ?? DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        widget.fields[index].value = picked;
        controllers[index].text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }
  Widget _buildField(int index) {
    var f = widget.fields[index];
    switch (f.type) {
      case FieldType.text:
      case FieldType.number:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: controllers[index],
            keyboardType: f.type == FieldType.number
                ? TextInputType.number
                : TextInputType.text,
            decoration: InputDecoration(
              labelText: f.label,
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (val) {
              if (f.type == FieldType.number) {
                f.value = int.tryParse(val) ?? f.value;
              } else {
                f.value = val;
              }
            },
          ),
        );
      case FieldType.dropdown:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: DropdownButtonFormField<String>(
            value: f.value,
            dropdownColor: Colors.blueAccent,
            decoration: InputDecoration(
              labelText: f.label,
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: TextStyle(color: Colors.white),
            items: f.options!
                .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                .toList(),
            onChanged: (val) {
              setState(() {
                f.value = val;
              });
            },
          ),
        );
      case FieldType.checkbox:
        return CheckboxListTile(
          title: Text(f.label, style: TextStyle(color: Colors.white)),
          value: f.value,
          onChanged: (val) {
            setState(() {
              f.value = val;
            });
          },
        );
      case FieldType.date:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () => _pickDate(index),
            child: IgnorePointer(
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: controllers[index],
                decoration: InputDecoration(
                  labelText: f.label,
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050B38),
      appBar: AppBar(
        backgroundColor: Color(0xFF050B38),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(widget.fields.length, (i) => _buildField(i)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                for (int i = 0; i < widget.fields.length; i++) {
                  var f = widget.fields[i];
                  if (f.type == FieldType.number) {
                    f.value = int.tryParse(controllers[i].text) ?? f.value;
                  } else if (f.type == FieldType.text) {
                    f.value = controllers[i].text;
                  }
                }
                Navigator.pop(context, widget.fields);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              icon: Icon(Icons.save_as_rounded, color: Colors.white, size: 18),
              label: Text(
                "Save Changes",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
