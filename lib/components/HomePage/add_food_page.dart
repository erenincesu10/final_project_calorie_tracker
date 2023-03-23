import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  _MyFormState() {
    _selectedVal = _foodList[0];
  }

  final _foodList = [
    "Choose",
    "Apple",
    "Banana",
    "Hamburger",
    "Bread",
    "Banana",
    "Hamburger",
    "Bread"
  ];
  String? _selectedVal = "Choose";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        title: Text("Liste Ekranı"),
      ),
      backgroundColor: Colors.orange.shade400,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Card(
              //         child: Column(
              //       children: [
              //         ListTile(
              //           leading: Icon(Icons.abc),
              //           title: Text("Seçilen yiyecek"),
              //           subtitle:
              //               Text("Seçilen yiyecek hakkında detaylı bilgi"),
              //         ),
              //       ],
              //     ))
              //   ],
              // ),
              Expanded(
                child: DropdownButton(
                  value: _selectedVal,
                  items: _foodList
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    _selectedVal = val as String;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
