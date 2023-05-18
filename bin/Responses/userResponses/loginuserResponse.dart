
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

loginResponse(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());

    File usersFile = File('bin/SavedFiles/Users/users.json');
    final List users = jsonDecode(await usersFile.readAsString());

    var login = users.firstWhere((user) =>
        user['email'] == body['email'] && user['password'] == body['password']);

    if (login.isEmpty) {
      return Response.forbidden("please enter a correct email and password");
    }

    return Response.ok('login successfull...');
  } catch (error) {

    return Response.notFound("failed to login");
  }
}
