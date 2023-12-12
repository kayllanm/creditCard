class CreditCardModel {
  int index;
  int cardNumber;
  int cardType;
  int cvv;
  String country;

  CreditCardModel(
      {required this.index,
      required this.cardNumber,
      required this.cardType,
      required this.cvv,
      required this.country});
}
