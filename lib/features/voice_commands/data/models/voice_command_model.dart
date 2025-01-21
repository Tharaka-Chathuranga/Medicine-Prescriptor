class VoiceCommand {
  final String command;
  final String action;

  VoiceCommand({required this.command, required this.action});

  factory VoiceCommand.fromJson(Map<String, dynamic> json) {
    return VoiceCommand(
      command: json['command'],
      action: json['action'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'action': action,
    };
  }
}