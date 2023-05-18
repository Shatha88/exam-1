// ignore_for_file: file_names

import 'dart:io';

import 'package:shelf/shelf.dart';

deleteImageResponse(Request _, String name) async {
  try {
    final file = File('bin/SavedFiles/images/$name');
    if (!file.existsSync()) {
      return Response.notFound(
          'please include image type with the name {png,jpg,..}',);
    }
    file.deleteSync();
    print('File deleted.');

    return Response.ok('image deleted...');
  } catch (error) {
    return Response.notFound('error while uploading image');
  }
}
