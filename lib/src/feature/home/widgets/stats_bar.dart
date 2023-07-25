import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({super.key, required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * (value / 100);
        return SizedBox(
          height: 15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: width,
                color: value > 50 ? Colors.green : Colors.red,
              ),
              Container(
                height: 5,
                width: constraints.maxWidth - width,
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}
