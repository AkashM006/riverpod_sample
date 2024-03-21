import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/providers/app_settings.provider.dart';

class AppPage extends ConsumerWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(appSettings),
        ),
      ),
    );
  }
}
