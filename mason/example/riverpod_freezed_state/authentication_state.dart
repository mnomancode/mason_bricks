import 'package:freezed_annotation/freezed_annotation.dart';

part of 'authentication_state.dart';

@freezed
abstract class AuthenticationState<User> with _$AuthenticationState<User> {
  const factory AuthenticationState.initial() = _AuthenticationInitial;
  
  const factory AuthenticationState.loading() = _AuthenticationLoading;
  
  const factory AuthenticationState.data(User data) = _AuthenticationData;

  const factory AuthenticationState.error(Object? e, [StackTrace? stk]) = _AuthenticationError;   
}