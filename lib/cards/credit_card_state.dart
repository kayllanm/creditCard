import 'package:creditcard/cards/credit_card_model.dart';

class CreditCardState {
  final List<CreditCardModel>? creditCard;

  CreditCardState({
    this.creditCard,
  });

  CreditCardState copyWith({
    required List<CreditCardModel> creditCard,
  }) {
    return CreditCardState(
      creditCard: creditCard ?? this.creditCard,
    );
  }
}
