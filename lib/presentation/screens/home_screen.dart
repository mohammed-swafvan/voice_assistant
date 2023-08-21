import 'package:allen/presentation/utils/colors.dart';
import 'package:allen/presentation/widgets/features_box_widget.dart';
import 'package:allen/presentation/widgets/floating_button_widget.dart';
import 'package:allen/presentation/widgets/virtual_assistant_widget.dart';
import 'package:allen/provider/allen_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<AllenProvider>(context, listen: false).initSpeechToText();
    Provider.of<AllenProvider>(context, listen: false).initTextToSpeech();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<AllenProvider>(context, listen: false).disposeSpeech();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BounceInDown(
          child: const Text("Allen"),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VirtualAssistanWidget(),
            Consumer<AllenProvider>(builder: (context, value, _) {
              return FadeInRight(
                child: Visibility(
                  visible: value.generatedImageUrl == null,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
                    ),
                    child: Text(
                      value.generatedContent == null ? 'Have A Nice Day, what task I can do for you?' : value.generatedContent!,
                      style: TextStyle(
                        color: CustomColors.mainFontColor,
                        fontFamily: 'Cera Pro',
                        fontSize: value.generatedContent == null ? 21 : 16,
                      ),
                    ),
                  ),
                ),
              );
            }),
            Consumer<AllenProvider>(builder: (context, value, _) {
              return value.generatedImageUrl != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.network(value.generatedImageUrl!),
                    )
                  : const SizedBox();
            }),
            Consumer<AllenProvider>(builder: (context, value, _) {
              return FadeInLeft(
                child: Visibility(
                  visible: value.generatedContent == null && value.generatedImageUrl == null,
                  child: Container(
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
                ),
              );
            }),
            Consumer<AllenProvider>(builder: (context, value, _) {
              return Visibility(
                visible: value.generatedContent == null && value.generatedImageUrl == null,
                child: Column(
                  children: [
                    FadeInLeft(
                      delay: Duration(milliseconds: value.delay),
                      child: const FeaturesBoxWidget(
                        headline: "ChatGPT",
                        body: "A smart way to say organized and informed with ChatGPT",
                        boxColor: CustomColors.firstSuggestionBoxColor,
                      ),
                    ),
                    FadeInLeft(
                      delay: Duration(milliseconds: value.delay * 2),
                      child: const FeaturesBoxWidget(
                        headline: "Dall-E",
                        body: "Get inspired and stay creative with your personal assistant powered by Dall-E",
                        boxColor: CustomColors.secondSuggestionBoxColor,
                      ),
                    ),
                    FadeInLeft(
                      delay: Duration(milliseconds: value.delay * 3),
                      child: const FeaturesBoxWidget(
                        headline: "Smart Voice Assistant",
                        body: "Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT",
                        boxColor: CustomColors.thirdSuggestionBoxColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: const FloatingButtonWidget(),
    );
  }
}
