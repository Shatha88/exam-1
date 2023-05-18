import 'dart:io';

import 'package:content_length_validator/content_length_validator.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'Routes/BaseRoute.dart';
import 'env/baseEnv.dart';

void main(List<String> _) async => withHotreload(() => createServer());

Future<HttpServer> createServer() async {
  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(
        maxContentLengthValidator(
          maxContentLength: 1028 * 1028 * 2,
        ),
      )
      .addMiddleware(logRequests())
      .addHandler(baseRoute().handler);

  // For running in containers, we respect the PORT environment variable.
  final server = await serve(handler, baseEnv().ip, baseEnv().port);
  print('Server listening on port ${server.port}');

  return server;
}
