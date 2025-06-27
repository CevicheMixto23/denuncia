import 'package:denuncia_v1/models/message_model.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  late DialogFlowtter _dialogFlowtter;
  List<Map<String, dynamic>> messages = [];
  final ScrollController chatScrollController = ScrollController();

  List<MessageM> messagesm = [];
  ChatProvider() {
    _initDialogflow();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    messagesm.add(MessageM(text: text, fromWho: FromWho.me));
    messages.add({'message': text, 'isUser': true});
    notifyListeners();

    final response = await _dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    final botResponse =
        response.message?.text?.text?[0] ?? "No entendí tu mensaje.";
    messages.add({'message': botResponse, 'isUser': false});
    messagesm.add(MessageM(text: botResponse, fromWho: FromWho.bot));
    notifyListeners();
  }

  Future<void> _initDialogflow() async {
    _dialogFlowtter = await DialogFlowtter.fromFile();
  }
}
