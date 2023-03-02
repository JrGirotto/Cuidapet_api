import 'dart:io';

import 'package:banhopet_api/application/config/application_config.dart';
import 'package:banhopet_api/application/middlewares/cors/cors_middlewares.dart';
import 'package:banhopet_api/application/middlewares/default_content_type/default_content_type.dart';
import 'package:banhopet_api/application/middlewares/security/security_middleware.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  //Application Config *JR
  final router = Router();
  final appConfig = ApplicationConfig();
  await appConfig.loadConfigApplication(router);

  final getIt = GetIt.I;

  // Configure a pipeline that logs requests.
  final handler = const Pipeline()
      .addMiddleware(CorsMiddlewares().handler)
      .addMiddleware(
          DefaultContentType('application/json;charset=utf-8').handler)
      .addMiddleware(SecurityMiddleware(getIt.get()).handler)
      .addMiddleware(logRequests())
      .addHandler(router);

  final ip = '0.0.0.0';
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server at ${server.address.host} on port ${server.port}');
}

// Configure routes.
/* final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World! SERVER OK!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
} */