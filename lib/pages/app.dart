import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/models/user_settings.model.dart';
import 'package:riverpod_sample/pages/home.dart';
import 'package:riverpod_sample/providers/app_settings.provider.dart';

class AppPage extends ConsumerWidget {
  const AppPage({super.key});

  void handleLoginTypeChange(WidgetRef ref, LoginType loginType) async {
    ref.read(userSettingsProvider.notifier).updateLoginType(loginType);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserSettingsModel> userSettings =
        ref.watch(userSettingsProvider);

    return userSettings.when(
      data: (data) => HomePage(
        userSettings: data,
      ),
      error: (error, _) => const Scaffold(
        body: Center(
          child: Text("Something went wrong. Please try again later!"),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Loading"),
            ],
          ),
        ),
      ),
    );
  }
}
