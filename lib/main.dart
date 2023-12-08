import 'package:creditcard/cards/credit_card_reducer.dart';
import 'package:creditcard/cards/credit_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<CreditCardState>(
    CreditCardReducer,
    initialState: CreditCardState(),
  );
  runApp(MainApp(store));
}

class MainApp extends StatelessWidget {
  final Store<CreditCardState> store;

  const MainApp(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CreditCardState>(
      store: store,
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Text('Card Number', style: TextStyle(fontSize: 16)),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
