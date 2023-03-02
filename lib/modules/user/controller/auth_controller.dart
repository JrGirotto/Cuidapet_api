// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:banhopet_api/application/exceptions/user_exists_exception.dart';
import 'package:banhopet_api/application/logger/i_logger.dart';
import 'package:banhopet_api/modules/user/service/i_user_service.dart';
import 'package:banhopet_api/modules/user/view_modules/user_save_input_model.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController {
  IUserService userService;
  ILogger log;
  AuthController({
    required this.userService,
    required this.log,
  });

  @Route.post('/register')
  Future<Response> saveUser(Request request) async {
    try {
      final userModel = UserSaveInputModel(await request.readAsString());
      await userService.createUser(userModel);
      return Response.ok(
          jsonEncode({'message': 'cadastro realizado com sucesso'}));
    } on UserExistsException {
      return Response(400,
          body: jsonEncode(
              {'message': 'Usuario ja cadastrado na base de dados'}));
    } catch (e) {
      log.error('Erro ao cadastrar usuário', e);
      return Response.internalServerError();
    }
  }

  Router get router => _$AuthControllerRouter(this);
}
