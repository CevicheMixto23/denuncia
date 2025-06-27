import 'package:denuncia_v1/models/message_model.dart';
import 'package:flutter/material.dart';

class BotMessageBubble extends StatelessWidget {
  final MessageM message;
  const BotMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(59, 130, 246, 0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
