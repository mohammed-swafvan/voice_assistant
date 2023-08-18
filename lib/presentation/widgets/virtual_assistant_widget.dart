import 'package:allen/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

class VirtualAssistanWidget extends StatelessWidget {
  const VirtualAssistanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Container(
          height: 120,
          margin: const EdgeInsets.only(top: 4),
          decoration: const BoxDecoration(
            color: CustomColors.assistantCircleColor,
            shape: BoxShape.circle,
          ),
        )),
        Container(
          height: 124,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/virtualAssistant.png'),
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
