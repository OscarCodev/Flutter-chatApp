import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    //usamos el Modelo
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    //el modelo tambien tiene un metodo 
    return yesNoModel.toMessageEntity();
  }
}
