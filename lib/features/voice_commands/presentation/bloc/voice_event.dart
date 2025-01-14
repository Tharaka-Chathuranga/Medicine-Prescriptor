part of 'voice_bloc.dart';

abstract class VoiceEvent extends Equatable {
  const VoiceEvent();

  @override
  List<Object> get props => [];
}

class StartListening extends VoiceEvent {}
class StopListening extends VoiceEvent {}
class VoiceCommandRecognized extends VoiceEvent {
  final String command;
  const VoiceCommandRecognized(this.command);

  @override
  List<Object> get props => [command];
}