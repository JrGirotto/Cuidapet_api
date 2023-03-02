// ignore_for_file: implementation_imports

import 'dart:io';

import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';

import 'package:banhopet_api/application/middlewares/middlewares.dart';

class CorsMiddlewares extends Middlewares {
  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
    'Access-Control-Allow-Header':
        '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}',
  };

  @override
  Future<Response> execute(Request request) async {
    if (request.method == 'OPTIONS') {
      return Response(HttpStatus.ok, headers: headers);
    }

    final response = await innerHandler(request);

    return response.change(headers: headers);
  }
}
