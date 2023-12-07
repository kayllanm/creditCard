class CreditCardModel {
  int cardNumber;
  int cardType;
  int cvv;
  String country;

  CreditCardModel(
      {required this.cardNumber,
      required this.cardType,
      required this.cvv,
      required this.country});

  // CreditCardModel.fromJson(Map<String, dynamic> json) {
  //   cardNumber = json['cardNumber'];
  //   cardType = json['cardType'];
  //   cvv = json['cvv'];
  //   country = json['country'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['cardNumber'] = this.cardNumber;
  //   data['cardType'] = this.cardType;
  //   data['cvv'] = this.cvv;
  //   data['country'] = this.country;
  //   return data;
  // }
}
