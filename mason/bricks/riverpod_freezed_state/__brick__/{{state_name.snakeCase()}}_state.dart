import 'package:freezed_annotation/freezed_annotation.dart';

part of '{{state_name.snakeCase()}}_state.dart';

@freezed
abstract class {{state_name.pascalCase()}}State<{{state_type.pascalCase()}}> with _${{state_name.pascalCase()}}State<{{state_type.pascalCase()}}> {
  const factory {{state_name.pascalCase()}}State.initial() = _{{state_name.pascalCase()}}Initial;
  
  const factory {{state_name.pascalCase()}}State.loading() = _{{state_name.pascalCase()}}Loading;
  
  const factory {{state_name.pascalCase()}}State.data({{state_type.pascalCase()}} data) = _{{state_name.pascalCase()}}Data;

  const factory {{state_name.pascalCase()}}State.error(Object? e, [StackTrace? stk]) = _{{state_name.pascalCase()}}Error;   
}