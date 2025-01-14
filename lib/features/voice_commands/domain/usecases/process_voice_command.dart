import 'package:dartz/dartz.dart';
import '../entities/failure.dart';
import '../repositories/voice_repository.dart';

class ProcessVoiceCommand {
  final VoiceRepository repository;

  ProcessVoiceCommand(this.repository);

  Future<Either<Failure, String>> execute(String command) async {
    try {
      final result = await repository.getRecognizedText();
      return Right(result);
    } catch (e) {
      return Left(VoiceFailure(e.toString()));
    }
  }
}