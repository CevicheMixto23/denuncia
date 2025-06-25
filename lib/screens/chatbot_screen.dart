import 'package:denuncia_v1/config/colors.dart';
import 'package:denuncia_v1/models/message_model.dart';
import 'package:denuncia_v1/providers/authmodel.dart';
import 'package:denuncia_v1/providers/chat_provider.dart';
import 'package:denuncia_v1/widgets/horizontal_carrousel.dart';
import 'package:denuncia_v1/widgets/message_field_box.dart';
import 'package:denuncia_v1/widgets/my_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (
        BuildContext context,
        ChatProvider chatProvider,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.darkBlue,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontSize: 20, color: Colors.white),
                children: [
                  const TextSpan(
                    text: 'DENUNC',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextSpan(
                    text: 'IA',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              // Fondo azul
              Positioned.fill(child: Container(color: AppColors.darkBlue)),
              // Imagen encima con opacidad 0.2
              Positioned.fill(
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/fondo_chatbot.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Espacio superior
                    const SizedBox(height: 20),
                    // Imagen del chatbot
                    Consumer<Authmodel>(
                      builder:
                          (context, auth, _) => Text(
                            'Hola, ${auth.displayName.isNotEmpty == true ? auth.displayName : "Usuario"} 👋',
                            style: TextStyle(
                              color: AppColors.gray,
                              fontSize: 22,
                            ),
                          ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '¿En qué te puedo ayudar hoy?',
                      style: TextStyle(color: AppColors.gray, fontSize: 25),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Reciente',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    HorizontalCarrousel(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        controller: chatProvider.chatScrollController,
                        itemCount: chatProvider.messagesm.length,
                        itemBuilder: (context, index) {
                          final message = chatProvider.messagesm[index];
                          return (message.fromWho == FromWho.me)
                              ? MyMessageBubble(message: message)
                              : MyMessageBubble(message: message);
                        },
                      ),
                    ),
                    MessageFieldBox(onValue: chatProvider.sendMessage),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
