import 'package:flutter/material.dart';

import '../state/{{feature_name.snakeCase()}}_state.dart';
import '../events/{{feature_name.snakeCase()}}_events.dart';

class {{feature_name_pascal}}Widget extends StatelessWidget {
  final {{feature_name_pascal}}State state;
  final Function({{feature_name_pascal}}Event) onEvent;

  const {{feature_name_pascal}}Widget({
    super.key,
    required this.state,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              children: [
                Icon(
{{#state_type}}
{{#simple}}
                  Icons.numbers,
{{/simple