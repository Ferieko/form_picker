import 'package:flutter/material.dart';
import 'package:form_picker/color_picker/color_picker_page.dart';
import 'package:form_picker/date_picker/date_picker.dart';
import 'package:form_picker/file_picker/AmbilFile.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HalamanUtama> {
  String? fileResult;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute<String>(
                  builder: (_) => const AmbilFile(
                    name: 'Juragan',
                  )))
                  .then((value) => {
                debugPrint('Hasil back dari filePickerPage $value'),
                fileResult = value,
                setState(() {})
              }),
              title: const Text('File Picker'),
              subtitle: Text("File Result = $fileResult"),
            ),
            ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AmbilWaktu())),
                title: const Text('Date Picker')),
            ListTile(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute<Color>(
                    builder: (_) => const PilihWarna()))
                    .then((value) {
                  color = value ?? Colors.blue;
                  setState(() {});
                }),
                title: const Text('Color Picker')),
            Container(
              width: 200,
              height: 200,
              color: color ?? Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}