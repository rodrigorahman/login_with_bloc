import 'package:get_it/get_it.dart';
import 'package:login_with_bloc_api/core/dependency_injection/dependency_injection_conf.dart';
import 'package:login_with_bloc_api/login_with_bloc_api.dart';
import 'package:login_with_bloc_api/modules/user/presentation/controllers/check_login_password_controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class LoginWithBlocApiChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    configureDependencies();
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route('/auth/login')
      .link(() => GetIt.instance.get<CheckLoginPasswordController>());

    return router;
  }
}