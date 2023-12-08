import 'package:creditcard/cards/actions.dart';
import 'package:creditcard/cards/credit_card_state.dart';

CreditCardState creditCardReducer(CreditCardState state, dynamic action) {
  if (action is AddCard) {
    return state.copyWith(count: state.count + 1);
  }

  return state;
}
