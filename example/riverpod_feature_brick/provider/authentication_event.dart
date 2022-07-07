import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.freezed.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.addTodo() = AddTodo;
}
