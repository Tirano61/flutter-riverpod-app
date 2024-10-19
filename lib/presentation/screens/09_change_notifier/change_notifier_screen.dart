import 'package:flutter/material.dart';


//class ChangeNotifierScreen extends StatelessWidget {

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/presentation/providers/todos_change_notifier_provider.dart';


class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(changeNotifierProvider.notifier).addTodo();
        }
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //final currentFilter = ref.watch(todoFilterProvider);
    final changeNotifier = ref.watch(changeNotifierProvider);
    final todos = changeNotifier.todos;

    return Column(
      children: [
        

        /* SegmentedButton(
          segments: const[
            ButtonSegment(value: TodoFilter.all, icon: Text('Todos')),
            ButtonSegment(value: TodoFilter.completed, icon: Text('Invitados')),
            ButtonSegment(value: TodoFilter.pending, icon: Text('No invitados')),
          ], 
          selected: <TodoFilter>{ currentFilter },
          onSelectionChanged: (value) {
            ref.read(todoFilterProvider.notifier).state = value.first; 
          },
        ), */
        const SizedBox( height: 5 ),
        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return SwitchListTile(
                title: Text(todo.description),
                value: todo.done, 
                onChanged: ( value ) {
                  ref.read(todosStateNotifierProvider.notifier).toggleTodo(todo.id);
                }
              );
            },
          ),
        )
      ],
    );
  }
}