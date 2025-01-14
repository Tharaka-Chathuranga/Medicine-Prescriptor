import 'package:flutter_tts/flutter_tts.dart';

class SpeakResponse {
  final FlutterTts _flutterTts;

  SpeakResponse(this._flutterTts);

  Future<void> call(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }
}