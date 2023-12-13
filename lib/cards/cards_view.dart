import 'package:creditcard/cards/credit_card_state.dart';
import 'package:creditcard/cards/credt_card_actions.dart';
import 'package:creditcard/cards/models.dart';
import 'package:creditcard/components/custom_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:localstorage/localstorage.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

List<CardTypes> list = [
  CardTypes(index: 0, name: 'American Express', startsWithNum: 101),
  CardTypes(index: 1, name: 'Barclays', startsWithNum: 102),
  CardTypes(index: 2, name: 'Capital One', startsWithNum: 103),
  CardTypes(index: 3, name: 'Chase', startsWithNum: 104),
  CardTypes(index: 4, name: 'Citi', startsWithNum: 105),
  CardTypes(index: 4, name: 'Discover', startsWithNum: 106),
  CardTypes(index: 5, name: 'Mastercard', startsWithNum: 107),
  CardTypes(index: 6, name: 'Visa', startsWithNum: 108),
  CardTypes(index: 6, name: 'Wells Fargo', startsWithNum: 109),
];

class _CardsViewState extends State<CardsView> {
  final TextEditingController cardNumber = TextEditingController();
  CardTypes cardType = list[0];
  final TextEditingController cvv = TextEditingController();
  final TextEditingController country = TextEditingController();
  final LocalStorage storage = LocalStorage('cards.json');
  late List<CreditCard> _listOfCards = [];

  @override
  void initState() {
    super.initState();
    String cardsList = storage.getItem('creditCards') ?? '';
    print(cardsList);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  onCardNumberChanged(val) {
    if (val.length > 2) {
      list.forEach((element) {
        if (element.startsWithNum.toString() == val.substring(0, 3)) {
          setState(() {
            cardType = element;
          });
        }
      });
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Basic dialog title'),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      CustomFields(
                          'Card Number', cardNumber, onCardNumberChanged),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const Text('Card Type',
                                style: TextStyle(fontSize: 16)),
                            DropdownMenu<CardTypes>(
                              initialSelection: cardType,
                              onSelected: (CardTypes? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  cardType = value!;
                                });
                              },
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<CardTypes>>(
                                      (CardTypes value) {
                                return DropdownMenuEntry<CardTypes>(
                                    value: value, label: value.name);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      CustomFields('CVV', cvv, () {}),
                      CustomFields('Country', country, () {}),
                      SizedBox(
                        height: 32,
                        width: MediaQuery.of(context).size.width,
                      ),
                      StoreConnector<CreditCardState, VoidCallback>(
                        converter: (store) => () {
                          CreditCard card = CreditCard(
                              cardNumber: int.parse(cardNumber.text),
                              cardType: cardType.index,
                              cvv: int.parse(cvv.text),
                              country: country.text);
                          Navigator.of(context).pop();
                          return store.dispatch(AddCard(creditCard: card));
                        },
                        builder: (context, callback) => MaterialButton(
                          color: Colors.green,
                          elevation: 0.0,
                          height: 50,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          onPressed: callback,
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _listOfCards.length > 0
            ? StoreConnector<CreditCardState, List<CreditCard>?>(
                converter: (store) => store.state.creditCard,
                builder: (context, cards) => ListView.builder(
                  itemCount: cards!.length,
                  prototypeItem: ListTile(
                    title: Text(cards.first.country),
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cards[index].country),
                    );
                  },
                ),
              )
            : const Text('No Cards added yet'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () => _dialogBuilder(context),
      ),
    );
  }
}
