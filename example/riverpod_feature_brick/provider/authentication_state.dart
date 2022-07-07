import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({
    /// TODO::add
    // required TodoModel todo,
  }) = _AuthenticationState;

  const AuthenticationState._();

  factory AuthenticationState.empty() => AuthenticationState(
        ///TODO::add
        // todoList: [],
      );
}
