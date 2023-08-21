import 'package:allen/presentation/utils/colors.dart';
import 'package:allen/provider/allen_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllenProvider>(
      builder: (context, value, _) {
        return ZoomIn(
          delay: Duration(milliseconds: value.delay * 4),
          child: FloatingActionButton(
            onPressed: () async {
              if (await value.speechText.hasPermission && value.speechText.isNotListening) {
                await value.startListening();
              } else if (value.speechText.isListening) {
                final String speech = await value.openAIServices.isArtPromptAPI(value.lastWords);
                if (speech.contains('https')) {
                  value.itISImageUrl(speech);
                } else {
                  value.itIsContent(speech);
                  await value.systemSpeak(speech);
                }
                await value.stopListening();
              } else {
                await value.initSpeechToText();
              }
            },
            backgroundColor: CustomColors.firstSuggestionBoxColor,
            child: Icon(
              value.speechText.isListening ? Icons.stop : Icons.mic,
            ),
          ),
        );
      },
    );
  }
}
