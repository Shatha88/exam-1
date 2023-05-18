// ignore_for_file: file_names, camel_case_types
import 'dart:io';

class baseEnv {
// For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final ip = InternetAddress.anyIPv4;
}
