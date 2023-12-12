import 'package:flutter/material.dart';

class CustomFields extends StatelessWidget {
  final String labelText;
  const CustomFields(this.labelText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Text(labelText, style: const TextStyle(fontSize: 16)),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
          )
        ],
      ),
    );
  }
}

const List<String> list = <String>["One", "Two", "Three", "Four"];

Future<DropdownMenu> CustomDropdown() {
  return DropdownMenu<String>(
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
}
