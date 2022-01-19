import 'package:challenge/src/widgets/company_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';

class CompanyList extends StatelessWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final companies = Provider.of<OrderProvider>(context).getTopCompanies();
    return SizedBox(
      height: size.height * 0.47,
      width: size.width * 0.9,
      child: Card(
          elevation: 5,
          child: ListView.builder(
            itemCount: companies.length,
            itemBuilder: (context, index) {
              return CompanyItem(
                  index: '${index + 1}.',
                  buyer: companies[index].buyer,
                  price: companies[index].price,
                  picture: companies[index].picture,
                  title: companies[index].company);
            },
          )),
    );
  }
}
