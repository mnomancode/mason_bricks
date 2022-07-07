import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(AuthenticationState.empty());

  void mapEventsToState(AuthenticationEvent event) async {
    event.map(addTodo: (addTodoEvent) {});
  }
}
