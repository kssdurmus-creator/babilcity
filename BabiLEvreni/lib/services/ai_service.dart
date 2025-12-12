import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AIService {
  final String? apiKey = dotenv.env['OPENAI_API_KEY'];

  Future<String> predict(String prompt, {bool premium = false}) async {
    if (apiKey == null || apiKey!.isEmpty) {
      return 'API anahtarı bulunamadı. .env dosyasına OPENAI_API_KEY ekleyin.';
    }
    final model = premium ? 'gpt-4.1' : 'gpt-4.1-mini';
    final uri = Uri.parse('https://api.openai.com/v1/chat/completions');
    final resp = await http.post(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${" "}' // placeholder to avoid committing key
    }, body: jsonEncode({
      'model': model,
      'messages': [
        {'role':'system','content':'You are BabiLEvreni, a professional Turkish sports assistant.'},
        {'role':'user','content':prompt}
      ],
      'temperature':0.6,
      'max_tokens':500,
    }));
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      return data['choices'][0]['message']['content'] ?? resp.body;
    } else {
      return 'OpenAI error: ' + resp.body;
    }
  }
}