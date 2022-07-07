import 'package:flutter_riverpod/flutter_riverpod.dart';
import '{{feature_name.snakeCase()}}_event.dart';
import '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Notifier extends StateNotifier<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Notifier() : super({{feature_name.pascalCase()}}State.empty());

  void mapEventsToState({{feature_name.pascalCase()}}Event event) async {
    event.map(addTodo: (addTodoEvent) {});
  }
}
