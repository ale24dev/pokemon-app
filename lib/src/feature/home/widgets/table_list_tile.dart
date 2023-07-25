import 'package:flutter/material.dart';

class Leading extends StatelessWidget {
  final Widget widget;

  const Leading(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4), child: widget);
  }
}

class Detail extends StatelessWidget {
  final Widget widget;

  const Detail(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4), child: widget);
  }
}
