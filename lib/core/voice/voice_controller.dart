import 'package:flutter_tts/flutter_tts.dart';

class VoiceController {
  late FlutterTts _flutterTts;

  VoiceController() {
    _flutterTts = FlutterTts();
  }

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}