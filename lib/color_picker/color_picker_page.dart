import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PilihWarna extends StatefulWidget {
  const PilihWarna({Key? key}) : super(key: key);

  @override
  State<PilihWarna> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<PilihWarna> {

  Color pickerColor = const Color(0xff443a49);

  Color currentColor = const Color(0xff443a49);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Text("Pick a Color : $pickerColor"),
              Container(
                width: 200,
                height: 200,
                color:pickerColor,
                //color: pickerColor,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pilih Warna yang di inginkan'),
                            content: SingleChildScrollView(
                              child: Material(
                                child: ColorPicker(
                                    pickerColor: pickerColor,
                                    onColorChanged: (Color color) {
                                      setState(() {
                                        pickerColor = color;
                                      });
                                    }),
                              ),
                            ),
                            actions: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () {
                                    // setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Pilih Warna"))
                            ],
                          );
                        });
                  },
                  child: const Text(" pilih warna disini")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, pickerColor);
                  },
                  child: const Text("Simpan"))
            ],
          )),
    );
  }
}