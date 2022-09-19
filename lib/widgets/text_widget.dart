import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String data;
  const TextHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: const TextStyle(
          fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
    );
  }
}

class TextContent extends StatelessWidget {
  final String data;
  final Color? color;
  const TextContent({super.key, required this.data, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: TextStyle(
        fontSize: 14,
        color: color ?? Colors.black54,
      ),
    );
  }
}
