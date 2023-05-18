// ignore_for_file: camel_case_types, file_names, recursive_getters

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/rootHandler.dart';
import 'Auth/authRoute.dart';
import 'mediaRoute.dart';

class baseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..mount('/auth', authRoute().handler)
      ..mount('/uploadimage', mediaRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.badRequest(body: "check your path again");
      });

    return router;
  }
}
