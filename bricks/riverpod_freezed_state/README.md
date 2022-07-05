# riverpod_freezed_state

A brick to create your riverpod freezed state!

This brick supports custom types and custom lists!

## How to use 🚀

```
mason make model --state_name authentication --state_type User
```

```
flutter pub run build_runner build --delete-conflicting-outputs
```


## Variables ✨

| Variable         | Description                         | Default | Type      |
| ---------------- | ------------------------------------| ------- | --------- |
| `state_name`     | The name of the riverpod state name | ToDo    | `string`  |
| `state_type`     | The name of the riverpod state type | ToDo    | `string`  |

## Outputs 📦

```
--state_name authentication --state_type User
├── authentication.dart
├── authentication.g.dart //You can generate this file using freezed
└── ...
```

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part of 'authentication_state.dart';

@freezed
abstract class AuthenticationState<User> with _$AuthenticationState<User> {
  const factory AuthenticationState.initial() = _AuthenticationInitial;
  
  const factory AuthenticationState.loading() = _AuthenticationLoading;
  
  const factory AuthenticationState.data(User data) = _AuthenticationData;

  const factory AuthenticationState.error(Object? e, [StackTrace? stk]) = _AuthenticationError;   
}

//Authentication.g.dart
part of 'authentication_state.dart';

```
