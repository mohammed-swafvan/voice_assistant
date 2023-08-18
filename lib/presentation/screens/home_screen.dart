import 'package:allen/presentation/utils/colors.dart';
import 'package:allen/presentation/widgets/features_box_widget.dart';
import 'package:allen/presentation/widgets/virtual_assistant_widget.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final speechText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    initSpeechToText();
    super.initState();
  }

  initSpeechToText() async {
    await speechText.initialize();
    setState(() {});
  }

  startListening() async {
    await speechText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  stopListening() async {
    await speechText.stop();
    setState(() {});
  }

  onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    speechText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Allen"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VirtualAssistanWidget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
              ),
              child: const Text(
                'Have A Nice Day, what task I can do for you?',
                style: TextStyle(
                  color: CustomColors.mainFontColor,
                  fontFamily: 'Cera Pro',
                  fontSize: 21,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 23),
              padding: const EdgeInsets.only(top: 12),
              child: const Text(
                'Here are few features',
                style: TextStyle(
                  color: CustomColors.mainFontColor,
                  fontFamily: 'Cera Pro',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const FeaturesBoxWidget(
              headline: "ChatGPT",
              body: "A smart way to say organized and informed with ChatGPT",
              boxColor: CustomColors.firstSuggestionBoxColor,
            ),
            const FeaturesBoxWidget(
              headline: "Dall-E",
              body: "Get inspired and stay creative with your personal assistant powered by Dall-E",
              boxColor: CustomColors.secondSuggestionBoxColor,
            ),
            const FeaturesBoxWidget(
              headline: "Smart Voice Assistant",
              body: "Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT",
              boxColor: CustomColors.thirdSuggestionBoxColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechText.hasPermission && speechText.isNotListening) {
            startListening();
          } else if (speechText.isListening) {
            stopListening();
          } else {
            initSpeechToText();
          }
        },
        backgroundColor: CustomColors.firstSuggestionBoxColor,
        child: const Icon(
          Icons.mic,
        ),
      ),
    );
  }
}
