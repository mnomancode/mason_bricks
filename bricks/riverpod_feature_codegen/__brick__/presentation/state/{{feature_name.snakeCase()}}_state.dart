import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature_name.snakeCase()}}_state.freezed.dart';
part '{{feature_name.snakeCase()}}_state.g.dart';

@freezed
class {{feature_name.pascalCase()}}State with _${{feature_name.pascalCase()}}State {
  const factory {{feature_name.pascalCase()}}State({
    // Sample: Counter app state
    @Default(0) int count,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _{{feature_name.pascalCase()}}State;

  factory {{feature_name.pascalCase()}}State.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}StateFromJson(json);
}

// Sample: State extensions for convenience
extension {{feature_name.pascalCase()}}StateX on {{feature_name.pascalCase()}}State {
  bool get hasError => errorMessage.isNotEmpty;
  bool get isEven => count % 2 == 0;
  bool get isPositive => count > 0;
}