part of 'voice_bloc.dart';

abstract class VoiceState extends Equatable {
  const VoiceState();
  
  @override
  List<Object> get props => [];
}

class VoiceInitial extends VoiceState {}
class VoiceLoading extends VoiceState {}
class VoiceListening extends VoiceState {}
class VoiceRecognized extends VoiceState {
  final String text;
  const VoiceRecognized(this.text);

  @override
  List<Object> get props => [text];
}
class VoiceError extends VoiceState {
  final String message;
  const VoiceError(this.message);

  @override
  List<Object> get props => [message];
}