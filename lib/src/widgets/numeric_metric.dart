import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NumericMetric extends StatelessWidget {
  final Color? color;
  final String title;
  final IconData icon;
  final Color? iconColor;
  final String subtitle;
  const NumericMetric(
      {Key? key,
      required this.color,
      required this.icon,
      required this.iconColor,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: kIsWeb ? size.height * 0.115 : size.height * 0.1,
      width: size.width * 0.295,
      child: Card(
        elevation: 8,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
