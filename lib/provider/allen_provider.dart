import 'package:allen/api/openai_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class AllenProvider extends ChangeNotifier {
  final speechText = SpeechToText();
  final flutterTts = FlutterTts();

  OpenAIServices openAIServices = OpenAIServices();

  String lastWords = '';
  String? generatedContent;
  String? generatedImageUrl;
  int delay = 400;

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    notifyListeners();
  }

  Future<void> initSpeechToText() async {
    await speechText.initialize();
    notifyListeners();
  }

  Future<void> startListening() async {
    await speechText.listen(onResult: onSpeechResult);
    notifyListeners();
  }

  Future<void> stopListening() async {
    await speechText.stop();
    notifyListeners();
  }

  onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    notifyListeners();
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  itISImageUrl(String speech) {
    generatedImageUrl = speech;
    generatedContent = null;
    notifyListeners();
  }

  itIsContent(String speech) {
    generatedImageUrl = null;
    generatedContent = speech;
    notifyListeners();
  }

  disposeSpeech() {
    speechText.stop();
    flutterTts.stop();
    notifyListeners();
  }
}
