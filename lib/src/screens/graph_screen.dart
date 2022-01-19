import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/order_provider.dart';

import '../models/Order.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;
    return Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          title: Text(
            'Info',
            style: TextStyle(color: Colors.blue[800]),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(
                  text: 'Main chart', textStyle: const TextStyle(fontSize: 20)),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<Order, String>>[
                LineSeries<Order, String>(
                    dataSource: orders,
                    xValueMapper: (Order order, _) => DateFormat.MMMd()
                        .format(DateTime.parse(order.registered))
                        .toString(),
                    yValueMapper: (Order order, _) => orders.indexOf(order),
                    name: 'Orders',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
        ]));
  }
}
