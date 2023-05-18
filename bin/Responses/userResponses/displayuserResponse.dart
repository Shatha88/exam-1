import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

displayuserResponse(Request _) async {
  try {
    File usersFile = File('bin/SavedFiles/Users/users.json');
    final List users = jsonDecode(await usersFile.readAsString());

    return Response.ok(jsonEncode(users),
        headers: {'Content-Type': 'Application/json'},);
  } catch (error) {
    return Response.notFound("faild to retrive users...");
  }
}
