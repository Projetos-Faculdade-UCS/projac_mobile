import 'package:flutter/material.dart';

class DetailField extends StatelessWidget {
  const DetailField({
    required this.title,
    required this.child,
    required this.icon,
    super.key,
  });
  final Widget icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
          ),
          child: icon,
        ),
        Expanded(
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: child,
          ),
        ),
      ],
    );
  }
}
