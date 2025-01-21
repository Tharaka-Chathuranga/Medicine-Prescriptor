import 'package:flutter/material.dart';

class VoiceActivationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const VoiceActivationButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.mic),
      tooltip: 'Activate Voice Command',
    );
  }
}