import 'package:creditcard/cards/cards_view.dart';
import 'package:creditcard/cards/credit_card_reducer.dart';
import 'package:creditcard/cards/credit_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<CreditCardState>(
    creditCardReducer,
    initialState: CreditCardState(),
  );
  runApp(MainApp(store));
}

class MainApp extends StatelessWidget {
  final Store<CreditCardState> store;
  MainApp(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CreditCardState>(
        store: store,
        child: MaterialApp(
          home: CardsView(),
        ));
  }
}
