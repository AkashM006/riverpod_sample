import 'package:drift/drift.dart';
import 'package:riverpod_sample/db/database.dart';
import 'package:riverpod_sample/db/schema/user_settings.schema.dart';

part 'user_settings.dao.g.dart';

@DriftAccessor(tables: [UserSettingsTable])
class UserSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$UserSettingsDaoMixin {
  UserSettingsDao(super.db);

  Future<UserSettingsTableData?> getUserSettings() async {
    final query = select(userSettingsTable)
      ..where(
        (tbl) => tbl.id.equals(0),
      );
    final result = await query.getSingleOrNull();
    return result;
  }

  Future<void> updateUserSettings(String newSettings) async {
    await into(userSettingsTable)
        .insertOnConflictUpdate(UserSettingsTableCompanion(
      id: const Value(0),
      settings: Value(newSettings),
    ));
  }
}
