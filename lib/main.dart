import 'package:creditcard/cards/credit_card_reducer.dart';
import 'package:creditcard/cards/credit_card_state.dart';
import 'package:creditcard/components/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<CreditCardState>(
    creditCardReducer,
    initialState: CreditCardState(),
  );
  runApp(MaterialApp(home: MainApp(store)));
}

const List<String> list = <String>["One", "Two", "Three", "Four"];

class MainApp extends StatelessWidget {
  final Store<CreditCardState> store;

  MainApp(this.store, {super.key});

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CustomFields('Card Number'),
                CustomFields('Card Type'),
                // DropdownMenu<String>(
                //   initialSelection: list.first,
                //   onSelected: (String? value) {
                //     // This is called when the user selects an item.
                //     // setState(() {
                //     //   dropdownValue = value!;
                //     // });
                //   },
                //   dropdownMenuEntries:
                //       list.map<DropdownMenuEntry<String>>((String value) {
                //     return DropdownMenuEntry<String>(
                //         value: value, label: value);
                //   }).toList(),
                // ),
                CustomFields('CVV'),
                CustomFields('Country'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CreditCardState>(
      store: store,
      child: Scaffold(
        appBar: AppBar(title: const Text('Cards')),
        body: Container(
          padding: EdgeInsets.all(16),
          child: const Text('No Cards added yet'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () => _dialogBuilder(context),
        ),
      ),
    );
  }
}
