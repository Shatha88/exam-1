import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

updateuserResponse(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());
    File usersFile = File('bin/SavedFiles/Users/users.json');
    final List users = jsonDecode(await usersFile.readAsString());

    var update = users.firstWhere((user) =>
        user['email'] == body['email'] && user['password'] == body['password']);

    if (!body.containsKey("email") &&
        !body.containsKey("password") &&
        !body.containsKey("name") &&
        !body.containsKey("age") &&
        !body.containsKey("address")) {
      return Response.forbidden("please add requested data..");
    }

    for (var user in users) {
      if (user['email'] == body['email'] &&
          user['password'] == body['password']) {
        user = body;
        break;
      }
    }

    usersFile.writeAsString(jsonEncode(users));

    return Response.ok('added successfully...');
  } catch (error) {
    return Response.notFound("failed to add");
  }
}
