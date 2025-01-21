
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class VoiceCommands {
  static const Map<String, String> COMMANDS = {
    'NEW_PATIENT': 'new patient',
    'SEARCH_PATIENT': 'search patient',
    'CREATE_PRESCRIPTION': 'create prescription',
    'VIEW_HISTORY': 'view history',
  };

  late stt.SpeechToText _speech;
  late stt.SpeechRecognitionResult result;
  bool _isListening = false;
  String _text = '';
  Function(String)? onResultCallback;

  VoiceCommands() {
    _speech = stt.SpeechToText();
  }

  Future<void> initSpeech() async {
    try {
      bool available = await _speech.initialize(
        onError: (error) => print('Speech recognition error: $error'),
        onStatus: (status) => print('Speech recognition status: $status'),
      );
      if (available) {
        print('Speech recognition available');
      } else {
        print('Speech recognition not available');
      }
    } catch (e) {
      print('Error initializing speech: $e');
    }
  }

  void startListening({Function(String)? onResult}) {
    if (!_isListening) {
      onResultCallback = onResult;
      _speech.listen(
        onResult: _onSpeechResult,
        listenFor: Duration(seconds: 30),
        pauseFor: Duration(seconds: 5),
        partialResults: true,
      );
      _isListening = true;
    }
  }

  void stopListening() {
    if (_isListening) {
      _speech.stop();
      _isListening = false;
    }
  }

  void _onSpeechResult(result) {
    _text = result.recognizedWords;
    print('Recognized words: $_text');
    
    if (onResultCallback != null) {
      onResultCallback!(_text);
    }
    
    _processCommand(_text);
  }

  void _processCommand(String text) {
    final lowercaseText = text.toLowerCase();
    for (var entry in COMMANDS.entries) {
      if (lowercaseText.contains(entry.value)) {
        print('Command detected: ${entry.key}');
        break;
      }
    }
  }

  bool get isListening => _isListening;
  String get text => _text;
}