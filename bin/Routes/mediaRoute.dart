// ignore_for_file: camel_case_types, file_names

import 'package:shelf_router/shelf_router.dart';

import '../Responses/ImageResponses/addimageResponse.dart';
import '../Responses/ImageResponses/deleteImageResponse.dart';

class mediaRoute {
  Router get handler {
    final router = Router()
          ..post('/addimage/<name>', addimageResponse) // 2. save image
          ..delete('/deleteimage/<name>', deleteImageResponse) // 5. delete image by name

        ;

    return router;
  }
}
