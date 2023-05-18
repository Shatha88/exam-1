// ignore_for_file: camel_case_types, file_names, recursive_getters

import 'package:shelf_router/shelf_router.dart';

import '../../Responses/userResponses/displayuserResponse.dart';
import '../../Responses/userResponses/loginuserResponse.dart';
import '../../Responses/userResponses/updateuserResponse.dart';
import '../../Responses/userResponses/useraddResponse.dart';

class authRoute {
  Router get handler {
    final router = Router()
          ..post('/login', loginResponse) // 1.user auth
          ..post('/adduser', useraddRespose) // 3. add user to file
          ..get('/displayall', displayuserResponse) // 4.display user info
          ..post('/updateuser', updateuserResponse) // 6. update information
        ;

    return router;
  }
}
