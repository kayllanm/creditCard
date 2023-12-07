import 'package:creditcard/cards/credit_card_model.dart';

class CreditCardState {
  bool loading;
  dynamic error;
  CreditCardModel? success;

  CreditCardState({
    required this.loading,
    this.error,
    this.success,
  });
  factory CreditCardState.initial() => CreditCardState(
        loading: false,
        error: null,
        success: null,
      );
}
