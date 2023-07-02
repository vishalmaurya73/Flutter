import 'package:flutter/material.dart';

class dropdown_menu extends StatefulWidget {
  const dropdown_menu({Key? key}) : super(key: key);

  @override
  State<dropdown_menu> createState() => _dropdown_menuState();
}

class _dropdown_menuState extends State<dropdown_menu> {
  String dropdownvalue = 'Selected Item';
  var items = [
    'Selected Item',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item no 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drodown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  child: Text(items),
                  value: items,
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
