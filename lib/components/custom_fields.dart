import 'package:flutter/material.dart';

class CustomFields extends StatelessWidget {
  final String labelText;
  final TextEditingController fieldController;
  final Function onChanged;
  const CustomFields(this.labelText, this.fieldController, this.onChanged,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        children: [
          Text(labelText, style: const TextStyle(fontSize: 16)),
          TextField(
            onChanged: (value) => onChanged,
            keyboardType: TextInputType.number,
            controller: fieldController,
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
