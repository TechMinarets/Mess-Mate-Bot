import 'package:dio/dio.dart';
import 'package:messmatebot/data/datasource/remote/api/chatbot_api.dart';
import 'package:messmatebot/data/datasource/remote/api/chatbot_api_impl.dart';
import 'package:messmatebot/data/datasource/remote/utils/api_client.dart';
import 'package:messmatebot/data/datasource/remote/utils/auth_interceptor.dart';
import 'package:messmatebot/injection_container/injection_container.dart';

Future<void> setUpNetworkModule() async {
  const int timeOut = 120 * 1000;
  // const String baseUrl = 'http://192.168.0.171:8000/api/';
  const String baseUrl = 'http://10.100.161.25:8000/api/';

  // Interceptor
  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      coreLocalDataSource: getIt(),
    ),
  );

  // Client
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: timeOut),
        receiveTimeout: const Duration(seconds: timeOut),
      ),
    )..interceptors.add(getIt<AuthInterceptor>()),
  );

  // ApiClient
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(client: getIt()),
  );

  getIt.registerLazySingleton<ChatBotApi>(
    () => ChatBotApiImpl(client: getIt()),
  );
}
