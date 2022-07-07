# riverpod_feature_brick

A brick to create your riverpod feature brick!

This brick supports custom types and custom lists!

## How to use 🚀

```
mason make riverpod_feature_brick --feature_name authentication
```

```
flutter pub run build_runner build --delete-conflicting-outputs
```


## Variables ✨

| Variable         | Description                           | Default | Type      |
| ---------------- | ------------------------------------- | ------- | --------- |
| `feature_name`   | The name of the riverpod feature name | ToDo    | `string`  |

## Outputs 📦

```
--feature_name authentication
├── provider
|   ├── authentication_event.dart
|   ├── authentication_notifier.dart
|   ├── authentication_provider.dart
|   ├── authentication_state.dart
|   ├── provider.dart
├── view
|   ├── authentication_view.dart
├── widgets
|   ├── widgets.dart
├── authentication.dart
└── ...
```
