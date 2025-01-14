import 'package:login_with_bloc_api/login_with_bloc_api.dart';

Future main() async {
  final app = Application<LoginWithBlocApiChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}