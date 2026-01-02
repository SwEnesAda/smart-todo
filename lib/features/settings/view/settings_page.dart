import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/theme_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.watch<ThemeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListTile(
        title: const Text('Dark Mode'),
        trailing: Switch(
          value: themeVM.themeMode == ThemeMode.dark,
          onChanged: (_) {
            themeVM.toggleTheme();
          },
        ),
      ),
    );
  }
}
