import 'package:creditcard/cards/credit_card_state.dart';

class AppState {
  final CreditCardState? creditCard;
  AppState({
    this.creditCard,
  });
  factory AppState.initial() => AppState(creditCard: CreditCardState.initial());
  AppState copyWith({
    CreditCardState? creditCard,
  }) {
    return AppState(
      creditCard: creditCard ?? this.creditCard,
    );
  }
}
