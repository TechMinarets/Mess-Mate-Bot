abstract class CoreLocalDataSource {
  String getPlatform();

  String getOperatingSystem();

  String getLocaleName();

  Future<String> getPackageName();

  Future<String> getApkVersion();
}
