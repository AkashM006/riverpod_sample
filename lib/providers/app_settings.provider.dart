import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_settings.provider.g.dart';

@riverpod
String appSettings(Ref ref) {
  return 'App Settings - 1';
}
