import 'package:messmatebot/data/repository/source/local/core_local_data_source.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_info/platform_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreLocalDataSourceImpl implements CoreLocalDataSource {
  final SharedPreferences _sharedPref;

  static const _constants = 'constants';

  CoreLocalDataSourceImpl({required SharedPreferences sharedPref})
      : _sharedPref = sharedPref;

  @override
  String getPlatform() => 'IO';

  @override
  String getOperatingSystem() {
    return switch (platform.operatingSystem) {
      OperatingSystem.android => 'Android',
      OperatingSystem.fuchsia => 'Fuchsia',
      OperatingSystem.iOS => 'iOS',
      OperatingSystem.linux => 'Linux',
      OperatingSystem.macOS => 'macOS',
      OperatingSystem.windows => 'Windows',
      OperatingSystem.unknown => 'Unknown',
    };
  }

  @override
  String getLocaleName() => platform.locale;

  @override
  Future<String> getPackageName() async {
    final platform = getPlatform();

    if (platform == 'WEB') return 'pte_app.exam_practice.mock_test';

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  @override
  Future<String> getApkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
