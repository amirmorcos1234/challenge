import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/numeric_metric.dart';
import '../widgets/company_list.dart';

import '../providers/order_provider.dart';

class OrdersOverviewScreen extends StatelessWidget {
  const OrdersOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        title: Text(
          'Home',
          style: TextStyle(color: Colors.blue[800]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Orders Overview',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumericMetric(
                  color: Colors.green[50],
                  icon: Icons.local_shipping,
                  iconColor: Colors.green[400],
                  subtitle: 'Total Orders',
                  title: ordersProvider.getTotalOrders().toString(),
                ),
                NumericMetric(
                  color: Colors.orange[50],
                  icon: Icons.attach_money,
                  iconColor: Colors.orange[400],
                  subtitle: 'Avg. Price',
                  title: ordersProvider.getAveragePrice(),
                ),
                NumericMetric(
                  color: Colors.red[50],
                  icon: Icons.replay,
                  iconColor: Colors.red[400],
                  subtitle: 'Returned',
                  title: ordersProvider.getReturnedListNumber().toString(),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Top Tier Companies',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            const CompanyList(),
          ],
        ),
      ),
    );
  }
}
