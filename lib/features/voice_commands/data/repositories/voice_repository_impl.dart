import 'package:sqlite_flutter_crud/core/services/speech_service.dart';
import 'package:sqlite_flutter_crud/features/voice_commands/domain/repositories/voice_repository.dart';
// import 'package:sqlite_flutter_crud/core/error/failures.dart';

class VoiceRepositoryImpl implements VoiceRepository {
  final SpeechService speechService;

  VoiceRepositoryImpl({required this.speechService});

  @override
  Future<void> startListening() async {
    try {
      await speechService.initSpeech();
      speechService.startListening((text) {
        // Handle recognized text
        print('Recognized: $text');
      });
    } catch (e) {
      throw VoiceFailure('Failed to start listening: $e');
    }
  }

  @override
  Future<void> stopListening() async {
    try {
      speechService.stopListening();
    } catch (e) {
      throw VoiceFailure('Failed to stop listening: $e');
    }
  }

  @override
  Future<String> getRecognizedText() async {
    try {
      return speechService.text;
    } catch (e) {
      throw VoiceFailure('Failed to get recognized text: $e');
    }
  }
}

class VoiceFailure implements Exception {
  final String message;
  VoiceFailure(this.message);
  
  @override
  String toString() => message;
}