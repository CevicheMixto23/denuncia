import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  late DialogFlowtter _dialogFlowtter;
  List<Map<String, dynamic>> messages = [];

  ChatProvider() {
    _initDialogflow();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    messages.add({'message': text, 'isUser': true});
    notifyListeners();

    final response = await _dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    final botResponse =
        response.message?.text?.text?[0] ?? "No entendí tu mensaje.";
    messages.add({'message': botResponse, 'isUser': false});
    notifyListeners();
  }

  Future<void> _initDialogflow() async {
    _dialogFlowtter = await DialogFlowtter.fromFile();
  }
}
