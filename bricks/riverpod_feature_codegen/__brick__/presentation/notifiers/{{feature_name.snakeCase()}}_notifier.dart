import 'package:riverpod_annotation/riverpod_annotation.dart';
import '{{feature_name.snakeCase()}}_state.dart';
import '{{feature_name.snakeCase()}}_event.dart';

part '{{feature_name.snakeCase()}}_notifier.g.dart';

@riverpod
class {{#notifier_name}}{{notifier_name.pascalCase()}}{{/notifier_name}}{{^notifier_name}}{{feature_name.pascalCase()}}Notifier{{/notifier_name}} extends _${{#notifier_name}}{{notifier_name.pascalCase()}}{{/notifier_name}}{{^notifier_name}}{{feature_name.pascalCase()}}Notifier{{/notifier_name}} {
  @override
  {{#has_async}}Future<{{return_type}}>{{/has_async}}{{^has_async}}{{return_type}}{{/has_async}} build({{arguments}}) {{#has_async}}async {{/has_async}}{
    // Sample: Initialize with counter state
    return const {{feature_name.pascalCase()}}State(count: 0);
  }

  // Sample: Handle events
  void handle{{feature_name.pascalCase()}}Event({{feature_name.pascalCase()}}Event event) {
    switch (event) {
      case {{feature_name.pascalCase()}}Event.increment:
        _increment();
        break;
      case {{feature_name.pascalCase()}}Event.decrement:
        _decrement();
        break;
      case {{feature_name.pascalCase()}}Event.reset:
        _reset();
        break;
    }
  }

  void _increment() {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(currentState.copyWith(count: currentState.count + 1));
    }
  }

  void _decrement() {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(currentState.copyWith(count: currentState.count - 1));
    }
  }

  void _reset() {
    state = const AsyncValue.data({{feature_name.pascalCase()}}State(count: 0));
  }
}