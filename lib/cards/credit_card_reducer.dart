import 'dart:convert';

import 'package:creditcard/cards/credt_card_actions.dart';
import 'package:creditcard/cards/credit_card_state.dart';
import 'package:creditcard/cards/models.dart';
import 'package:localstorage/localstorage.dart';

CreditCardState creditCardReducer(CreditCardState state, dynamic action) {
  final LocalStorage storage = LocalStorage('cards.json');
  if (action is AddCard) {
    String storedCards = storage.getItem('creditCards') ?? '';
    print(jsonDecode(storedCards));
    List<CreditCard> list = jsonDecode(storedCards);
    list.add(action.creditCard);
    String jsonDate = jsonEncode(list.toList());
    storage.setItem('creditCards', jsonDate);
    // return CreditCardState(creditCard: []..add(action.creditCard));
  } else if (action is ListCards) {
    print(action);
  }

  return state;
}
