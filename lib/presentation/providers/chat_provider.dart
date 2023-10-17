import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //Controlar el scrool: instancia de ScrollController que se asocia en el list view builder
  final ScrollController chatScrollController = ScrollController();

  //Para obtener la respuesta http: instancia de GestYesNoAnswer
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  //Nuestra lista de mensajes o pequeña base de datos
  List<Message> messageList = [];

  //enviar mensaje
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply(); //respuesta de ella
    }

    if (text == "cls") {
      messageList.clear();
    }

    notifyListeners(); //notifica a todos los oyentes
    moveScroolToBottom(); //se mueve el scrool al final
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScroolToBottom();
  }

  Future<void> moveScroolToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
