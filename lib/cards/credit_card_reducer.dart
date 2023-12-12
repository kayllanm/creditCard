import 'package:creditcard/cards/credit_card_model.dart';
import 'package:creditcard/cards/credt_card_actions.dart';
import 'package:creditcard/cards/credit_card_state.dart';

CreditCardState creditCardReducer(CreditCardState state, dynamic action) {
  if (action is AddCard) {
    print(action);
    // state.creditCard.add(action.creditCard as CreditCardModel);
    // return state.copyWith(creditCard: state.creditCard.add(action.creditCard));
  } else if (action is ListCards) {
    print(action);
  }

  return state;
}
