import 'dart:convert';

import 'package:allen/api/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIServices {
  // Future<String> isArtPromptAPI(String prompt) async {
  //   try {
  //     final http.Response response = await http.post(
  //       Uri.parse('https://api.openai.com/v1/chat/completions'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $openApiKkey',
  //       },
  //       body: jsonEncode({
  //         "model": "gpt-3.5-turbo",
  //         "messages": [
  //           {
  //             "role": "system",
  //             "content":
  //                 "Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.",
  //           },
  //         ],
  //       }),
  //     );
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       print('yeeeeeeg');
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  Future<String> chatGPTAPI(String prompt) async {
    return 'chatGPT';
  }

  Future<String> dallEAPI(String prompt) async {
    return 'Dall-E';
  }
}
