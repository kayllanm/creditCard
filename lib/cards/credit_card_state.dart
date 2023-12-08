import 'package:creditcard/cards/credit_card_model.dart';

class CreditCardState {
  bool loading;
  dynamic error;
  CreditCardModel? success;

  CreditCardState({
    this.loading = false,
    this.error,
    this.success,
  });
  factory CreditCardState.initial() => CreditCardState(
        loading: false,
        error: null,
        success: null,
      );
}
