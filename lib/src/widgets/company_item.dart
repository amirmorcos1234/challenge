import 'package:flutter/material.dart';

class CompanyItem extends StatelessWidget {
  final String picture;
  final String title;
  final String buyer;
  final String price;
  final String index;

  const CompanyItem(
      {Key? key,
      required this.index,
      required this.buyer,
      required this.price,
      required this.picture,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          width: 65,
          child: Row(children: [
            SizedBox(width: 20, child: Text(index)),
            Image.network(
              picture,
              height: 40,
              width: 40,
            )
          ])),
      title: Text(title),
      subtitle: Text(buyer),
      trailing: Text(price),
    );
  }
}
