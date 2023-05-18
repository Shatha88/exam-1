// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';

addimageResponse(Request req, String name) async {
  try {
    final MediaType content = MediaType.parse(req.headers['Content-Type']!);

    if (content.type != 'image') {
      return Response.forbidden('file is not image');
    }

    if (content.mimeType != 'image/png' && content.mimeType != 'image/jpg') {
      return Response.forbidden('unsuported image type');
    }

    final completer = Completer<List<int>>();
    final chuncks = <List<int>>[];

    req.read().listen(
      (chunck) {
        chuncks.add(chunck);
      },
      onDone: () {
        completer.complete(chuncks.expand((bit) => bit).toList());
      },
      onError: (error) {
        return Response.forbidden('error while loading..');
      },
    );

    final byteImage = await completer.future;

    final file = File('bin/SavedFiles/images/$name.${content.subtype}');
    await file.writeAsBytes(byteImage);

    return Response.ok('image Uploaded...');
  } catch (error) {
    return Response.notFound('error while uploading image');
  }
}
