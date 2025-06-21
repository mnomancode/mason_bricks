import 'package:riverpod_annotation/riverpod_annotation.dart';
import '{{feature_name.snakeCase()}}_state.dart';

part '{{feature_name.snakeCase()}}_notifier.g.dart';

@riverpod
class {{#notifier_name}}{{notifier_name.pascalCase()}}{{/notifier_name}}{{^notifier_name}}{{feature_name.pascalCase()}}Notifier{{/notifier_name}} extends _${{#notifier_name}}{{notifier_name.pascalCase()}}{{/notifier_name}}{{^notifier_name}}{{feature_name.pascalCase()}}Notifier{{/notifier_name}} {
  @override
  {{#has_async}}Future<{{return_type}}>{{/has_async}}{{^has_async}}{{return_type}}{{/has_async}} build({{arguments}}) {{#has_async}}async {{/has_async}}{
    // TODO: Initialize and return {{return_type}}
    {{#has_async}}throw UnimplementedError();{{/has_async}}{{^has_async}}{{#return_type}}{{^return_type}}{{/return_type}}{{/return_type}}{{/has_async}}
  }

  // TODO: Add your methods here
}