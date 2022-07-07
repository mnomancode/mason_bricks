import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature_name.snakeCase()}}_state.freezed.dart';

@freezed
class {{feature_name.pascalCase()}}State with _${{feature_name.pascalCase()}}State {
  factory {{feature_name.pascalCase()}}State({
    /// TODO::add
    // required TodoModel todo,
  }) = _{{feature_name.pascalCase()}}State;

  const {{feature_name.pascalCase()}}State._();

  factory {{feature_name.pascalCase()}}State.empty() => {{feature_name.pascalCase()}}State(
        ///TODO::add
        // todoList: [],
      );
}
