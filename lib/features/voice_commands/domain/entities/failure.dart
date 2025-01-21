abstract class Failure {
  final String message;
  const Failure(this.message);
}

class VoiceFailure extends Failure {
  const VoiceFailure(String message) : super(message);
}