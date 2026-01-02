import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task.dart' show Task;

import '../viewmodel/task_view_model.dart';
import '../../../core/theme/theme_view_model.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TaskViewModel>();
    final tasks = viewModel.tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Todo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeViewModel>().toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: tasks.isEmpty
                ? const _EmptyState()
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];

                      return Dismissible(
                        key: ValueKey(task.taskId),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) {
                          context.read<TaskViewModel>().deleteTask(task);

                          _showUndo(context, task);
                        },
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),
                          ),
                          leading: Checkbox(
                            value: task.isCompleted,
                            onChanged: (_) {
                              context.read<TaskViewModel>().toggleTask(task);
                            },
                          ),
                          onTap: () => _showEditDialog(context, task),
                        ),
                      );
                    },
                  ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text("Enes Ada tarafından hazırlanmıştır", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // ADD TASK
  void _showAddDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Yeni Görev"),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("İptal")),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;

              context.read<TaskViewModel>().addTask(
                Task(
                  taskId: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: controller.text.trim(),
                  isCompleted: false,
                ),
              );

              Navigator.pop(context);
            },
            child: const Text("Ekle"),
          ),
        ],
      ),
    );
  }

  // EDIT TASK
  void _showEditDialog(BuildContext context, Task task) {
    final controller = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Görevi Düzenle"),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("İptal")),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;

              context.read<TaskViewModel>().updateTask(task.copyWith(title: controller.text.trim()));

              Navigator.pop(context);
            },
            child: const Text("Kaydet"),
          ),
        ],
      ),
    );
  }

  // UNDO
  void _showUndo(BuildContext context, Task task) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Görev silindi"),
        action: SnackBarAction(
          label: "GERİ AL",
          onPressed: () {
            context.read<TaskViewModel>().addTask(task);
          },
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.task_alt, size: 64), SizedBox(height: 12), Text("Henüz görev yok")],
      ),
    );
  }
}
