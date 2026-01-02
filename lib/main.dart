import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'package:smart_todo/core/theme/theme_view_model.dart';
import 'features/tasks/view/task_page.dart';

// BURAYA DİKKAT: TaskViewModel dosyanın yolu farklıysa orayı güncelle
import 'features/tasks/viewmodel/task_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => TaskViewModel()), // Eksik olan satır buydu
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.watch<ThemeViewModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeVM.themeMode,
      home: const TaskPage(),
    );
  }
}
