import 'package:flutter_riverpod/flutter_riverpod.dart';
import '{{feature_name.snakeCase()}}_notifier.dart';

final {{feature_name.pascalCase()}}NotifierProvider = StateNotifierProvider<{{feature_name.pascalCase()}}Notifier, {{feature_name.pascalCase()}}State>(
  (ref) {
    return {{feature_name.pascalCase()}}Notifier();
  },
);
