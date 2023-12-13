import 'package:creditcard/cards/models.dart';

class CreditCardState {
  final List<CreditCard>? creditCard;

  CreditCardState({
    this.creditCard,
  });

  CreditCardState copyWith({
    required List<CreditCard> creditCard,
  }) {
    return CreditCardState(
      creditCard: creditCard ?? this.creditCard,
    );
  }
}
