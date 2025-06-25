import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    late FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Realiza tu pregunta...',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

      filled: true,
      fillColor: Color.fromRGBO(0, 0, 0, 0.2),
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
          Future.delayed(const Duration(milliseconds: 50), () {
            focusNode.requestFocus();
          });
        },
        icon: const Icon(Icons.send, color: Colors.white),
      ),
    );

    return TextFormField(
      style: const TextStyle(color: Colors.white),
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,

      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
        textController.selection = TextSelection.fromPosition(
          const TextPosition(offset: 0), // Coloca el cursor al final
        );
      },
    );
  }
}
