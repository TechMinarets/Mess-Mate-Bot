import 'package:dio/dio.dart';
import 'package:messmatebot/data/repository/source/local/core_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final CoreLocalDataSource _coreLocalDataSource;

  AuthInterceptor({
    required CoreLocalDataSource coreLocalDataSource,
  }) : _coreLocalDataSource = coreLocalDataSource;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final platform = _coreLocalDataSource.getPlatform();
    final os = _coreLocalDataSource.getOperatingSystem();
    final localeName = _coreLocalDataSource.getLocaleName();
    final packageName = await _coreLocalDataSource.getPackageName();
    final versionName = await _coreLocalDataSource.getApkVersion();

    var requestHeaders = [
      MapEntry('App-Platform', platform),
      MapEntry('App-Os', os),
      MapEntry('App-Locale', localeName),
      MapEntry('App-Package-Name', packageName),
      const MapEntry("Cross-Origin-Opener-Policy", "same-origin allow-popups"),
      MapEntry('App-Version', versionName),
    ];

    // final token = _accountLocalDataSource.getServerToken();
    const token = 'dcf6bef328219d9c3e28aa3242491af02e070f9d';
    if (token != null) {
      requestHeaders.add(MapEntry('Authorization', 'Token $token'));
    }

    options.headers.addEntries(requestHeaders);
    handler.next(options);
  }
}
