import 'package:allen/presentation/utils/hight_width.dart';
import 'package:flutter/material.dart';

class FeaturesBoxWidget extends StatelessWidget {
  const FeaturesBoxWidget({
    super.key,
    required this.headline,
    required this.body,
    required this.boxColor,
  });
  final String headline;
  final String body;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightWidth.kHeight10,
          Text(
            headline,
            style: const TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          HeightWidth.kHeight5,
          Text(
            body,
            style: const TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 16,
            ),
          ),
          HeightWidth.kHeight10,
        ],
      ),
    );
  }
}
