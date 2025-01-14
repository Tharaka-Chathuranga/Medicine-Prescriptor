import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/voice_repository.dart';

part 'voice_event.dart';
part 'voice_state.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  final VoiceRepository voiceRepository;

  VoiceBloc({required this.voiceRepository}) : super(VoiceInitial()) {
    on<StartListening>(_onStartListening);
    on<StopListening>(_onStopListening);
    on<VoiceCommandRecognized>(_onVoiceCommandRecognized);
  }

  Future<void> _onStartListening(StartListening event, Emitter<VoiceState> emit) async {
    try {
      emit(VoiceLoading());
      await voiceRepository.startListening();
      emit(VoiceListening());
    } catch (e) {
      emit(VoiceError(e.toString()));
    }
  }

  Future<void> _onStopListening(StopListening event, Emitter<VoiceState> emit) async {
    try {
      await voiceRepository.stopListening();
      emit(VoiceInitial());
    } catch (e) {
      emit(VoiceError(e.toString()));
    }
  }

  Future<void> _onVoiceCommandRecognized(
    VoiceCommandRecognized event, 
    Emitter<VoiceState> emit
  ) async {
    try {
      final text = await voiceRepository.getRecognizedText();
      emit(VoiceRecognized(text));
    } catch (e) {
      emit(VoiceError(e.toString()));
    }
  }
}