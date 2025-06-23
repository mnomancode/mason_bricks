import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/{{feature_name_snake}}_notifier.dart';
import '../widgets/{{feature_name_snake}}_widget.dart';
import '../events/{{feature_name_snake}}_events.dart';

class {{feature_name_pascal}}Page extends ConsumerWidget {
  const {{feature_name_pascal}}Page({super.key});

  static const String routeName = '/{{feature_name_kebab}}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch({{feature_name_camel}}NotifierProvider);
    final notifier = ref.read({{feature_name_camel}}NotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name_pascal}}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
{{#state_type}}
{{#simple}}
        actions: [
          IconButton(
            onPressed: () => notifier.handleEvent(
              const {{feature_name_pascal}}Event.reset(),
            ),
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset',
          ),
        ],
{{/simple}}
{{#custom}}
        actions: [
          IconButton(
            onPressed: () => notifier.handleEvent(
              const {{feature_name_pascal}}Event.refresh(),
            ),
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
{{/custom}}
{{#list}}
        actions: [
          IconButton(
            onPressed: () => notifier.handleEvent(
              const {{feature_name_pascal}}Event.refreshItems(),
            ),
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
          IconButton(
            onPressed: () => _showAddItemDialog(context, notifier),
            icon: const Icon(Icons.add),
            tooltip: 'Add Item',
          ),
        ],
{{/list}}
{{/state_type}}
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '{{feature_description}}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This is the {{feature_name_pascal}} feature page with Riverpod state management.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Error Display
              if (state.error != null)
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Error: ${state.error}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => notifier.handleEvent(
{{#state_type}}
{{#simple}}
                            const {{feature_name_pascal}}Event.reset(),
{{/simple}}
{{#custom}}
                            const {{feature_name_pascal}}Event.clear(),
{{/custom}}
{{#list}}
                            const {{feature_name_pascal}}Event.loadItems(),
{{/list}}
{{/state_type}}
                          ),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
              
              if (state.error != null) const SizedBox(height: 16),
              
              // Loading Indicator
              if (state.isLoading)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 12),
                        Text('Loading...'),
                      ],
                    ),
                  ),
                ),
              
              if (state.isLoading) const SizedBox(height: 16),
              
              // Main Content Widget
              Expanded(
                child: {{feature_name_pascal}}Widget(
                  state: state,
                  onEvent: notifier.handleEvent,
                ),
              ),
            ],
          ),
        ),
      ),
{{#state_type}}
{{#simple}}
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => notifier.handleEvent(
              const {{feature_name_pascal}}Event.increment(),
            ),
            tooltip: 'Increment',
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => notifier.handleEvent(
              const {{feature_name_pascal}}Event.decrement(),
            ),
            tooltip: 'Decrement',
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
{{/simple}}
{{#custom}}
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateDialog(context, notifier),
        icon: const Icon(Icons.add),
        label: const Text('Create'),
      ),
{{/custom}}
{{#list}}
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context, notifier),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
{{/list}}
{{/state_type}}
    );
  }

{{#state_type}}
{{#custom}}
  void _showCreateDialog(BuildContext context, {{feature_name_pascal}}Notifier notifier) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create {{feature_name_pascal}}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                notifier.handleEvent(
                  {{feature_name_pascal}}Event.create(
                    nameController.text,
                    description: descriptionController.text.isEmpty 
                        ? null 
                        : descriptionController.text,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
{{/custom}}
{{#list}}
  void _showAddItemDialog(BuildContext context, {{feature_name_pascal}}Notifier notifier) {
    final titleController = TextEditingController();
    final subtitleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add {{feature_name_pascal}} Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                labelText: 'Subtitle (Optional)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                notifier.handleEvent(
                  {{feature_name_pascal}}Event.addItem(
                    titleController.text,
                    subtitle: subtitleController.text.isEmpty 
                        ? null 
                        : subtitleController.text,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
{{/list}}
{{/state_type}}
}