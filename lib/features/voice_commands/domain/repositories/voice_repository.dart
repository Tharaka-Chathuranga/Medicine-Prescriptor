abstract class VoiceRepository {
  Future<void> startListening();
  Future<void> stopListening();
  Future<String> getRecognizedText();
}