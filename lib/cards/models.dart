class CreditCard {
  int cardNumber = 0;
  int cardType = 0;
  int cvv = 0;
  String country = '';

  CreditCard(
      {required this.cardNumber,
      required this.cardType,
      required this.cvv,
      required this.country});

  CreditCard.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    cvv = json['cvv'];
    country = json['country'];
  }

  Map toJson() => {
        'cardNumber': cardNumber,
        'cardType': cardType,
        'cvv': cvv,
        'country': country,
      };
}

class CardTypes {
  int index;
  String name;
  int startsWithNum;

  CardTypes(
      {required this.index, required this.name, required this.startsWithNum});
}
