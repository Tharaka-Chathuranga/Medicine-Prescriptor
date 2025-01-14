import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  SpeechService() {
    _speech = stt.SpeechToText();
  }

  Future<void> initSpeech() async {
    bool available = await _speech.initialize();
    if (available) {
      print('Speech recognition available');
    } else {
      print('Speech recognition not available');
    }
  }

  void startListening(Function(String) onResult) {
    _speech.listen(onResult: (val) => onResult(val.recognizedWords));
    _isListening = true;
  }

  void stopListening() {
    _speech.stop();
    _isListening = false;
  }

  bool get isListening => _isListening;
  String get text => _text;
}