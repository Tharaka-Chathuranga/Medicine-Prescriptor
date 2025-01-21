import 'package:flutter/material.dart';

class VoiceFeedbackWidget extends StatelessWidget {
  final String feedbackText;

  const VoiceFeedbackWidget({Key? key, required this.feedbackText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        feedbackText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}