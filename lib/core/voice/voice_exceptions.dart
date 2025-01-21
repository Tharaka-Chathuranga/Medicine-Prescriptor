class VoiceException implements Exception {
  final String message;
  VoiceException(this.message);

  @override
  String toString() => 'VoiceException: $message';
}

class MicrophoneNotAvailableException extends VoiceException {
  MicrophoneNotAvailableException() : super('Microphone is not available.');
}

class PermissionDeniedException extends VoiceException {
  PermissionDeniedException() : super('Permission to access the microphone was denied.');
}

class VoiceRecognitionFailedException extends VoiceException {
  VoiceRecognitionFailedException() : super('Voice recognition failed.');
}