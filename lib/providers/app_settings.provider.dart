import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample/models/user_settings.model.dart';
import 'package:riverpod_sample/utils/app_db.dart';

part 'app_settings.provider.g.dart';

const placeholderUserSettingsModel =
    UserSettingsModel(loginType: LoginType.notSet);

@riverpod
class UserSettings extends _$UserSettings {
  @override
  Future<UserSettingsModel> build() async {
    final result = await AppDb.database?.userSettingsDao.getUserSettings();
    if (result == null) return placeholderUserSettingsModel;
    return UserSettingsModel.fromJson(jsonDecode(result.settings));
  }

  Future<void> updateLoginType(LoginType loginType) async {
    final previous = await future;
    final newSettings = previous.copyWith(loginType: loginType);
    await AppDb.database?.userSettingsDao
        .updateUserSettings(jsonEncode(newSettings));
    state = AsyncData(newSettings);
  }
}
