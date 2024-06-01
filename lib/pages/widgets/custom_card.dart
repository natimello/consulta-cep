import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromARGB(255, 232, 225, 245),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
