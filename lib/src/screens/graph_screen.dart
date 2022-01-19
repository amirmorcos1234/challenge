import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/order_provider.dart';

import '../models/Graph.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrderProvider>(context);
    final graphData = ordersProvider.getGraphData();
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
              series: <ChartSeries<Graph, String>>[
                LineSeries<Graph, String>(
                    dataSource: graphData,
                    xValueMapper: (Graph graph, _) => DateFormat.MMMd()
                        .format(DateTime.parse(graph.year))
                        .toString(),
                    yValueMapper: (Graph graph, _) => graph.count,
                    name: 'Orders',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
        ]));
  }
}
