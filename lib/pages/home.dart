import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/models/user_settings.model.dart';
import 'package:riverpod_sample/providers/app_settings.provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
    required this.userSettings,
  });

  final UserSettingsModel userSettings;

  @override
  ConsumerState<HomePage> createState() {
    return _HomePageState();
  }
}

const customLoader = SizedBox(
  height: 20,
  width: 20,
  child: CircularProgressIndicator(),
);

class _HomePageState extends ConsumerState<HomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    void handleLoginTypeChange(LoginType loginType) async {
      setState(() {
        loading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      await ref.read(userSettingsProvider.notifier).updateLoginType(loginType);
      setState(() {
        loading = false;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Type: ${widget.userSettings.loginType}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () => !loading
                        ? handleLoginTypeChange(LoginType.deviceLogin)
                        : null,
                    child: loading ? customLoader : const Text('Device Login'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () => !loading
                        ? handleLoginTypeChange(LoginType.custom)
                        : null,
                    child: loading ? customLoader : const Text('Custom Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
