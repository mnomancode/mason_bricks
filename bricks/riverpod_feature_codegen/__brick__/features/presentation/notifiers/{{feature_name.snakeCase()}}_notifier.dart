import 'package:riverpod_annotation/riverpod_annotation.dart';
{{#include_logger}}import 'package:logger/logger.dart';{{/include_logger}}

import '{{feature_name.snakeCase()}}_state.dart';
import '{{feature_name.snakeCase()}}_events.dart';
{{#include_repository}}import '../data/{{feature_name.snakeCase()}}_repository.dart';{{/include_repository}}

part '{{feature_name.snakeCase()}}_notifier.g.dart';

@riverpod
class {{feature_name_pascal}}Notifier extends _${{feature_name_pascal}}Notifier {
{{#include_logger}}
  final _logger = Logger();
{{/include_logger}}

  @override
  {{feature_name_pascal}}State build() {
{{#include_logger}}
    _logger.i('Initializing {{feature_name_pascal}}Notifier');
{{/include_logger}}
    return const {{feature_name_pascal}}State();
  }

  void handleEvent({{feature_name_pascal}}Event event) {
{{#include_logger}}
    _logger.d('Handling event: $event');
{{/include_logger}}
    
    event.when(
{{#state_type}}
{{#simple}}
      increment: _handleIncrement,
      decrement: _handleDecrement,
      reset: _handleReset,
      setValue: _handleSetValue,
{{/simple}}
{{#custom}}
      load: _handleLoad,
      refresh: _handleRefresh,
      create: _handleCreate,
      update: _handleUpdate,
      delete: _handleDelete,
      clear: _handleClear,
{{/custom}}
{{#list}}
      loadItems: _handleLoadItems,
      refreshItems: _handleRefreshItems,
      addItem: _handleAddItem,
      updateItem: _handleUpdateItem,
      deleteItem: _handleDeleteItem,
      toggleItem: _handleToggleItem,
      clearCompleted: _handleClearCompleted,
{{/list}}
{{/state_type}}
    );
  }

{{#state_type}}
{{#simple}}
  void _handleIncrement() {
    state = state.copyWith(value: state.value + 1);
  }

  void _handleDecrement() {
    state = state.copyWith(value: state.value - 1);
  }

  void _handleReset() {
    state = state.copyWith(value: 0);
  }

  void _handleSetValue(int value) {
    state = state.copyWith(value: value);
  }
{{/simple}}
{{#custom}}
  Future<void> _handleLoad() async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      final data = await repository.load{{feature_name_pascal}}Data();
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      final data = {{feature_name_pascal}}Data(
        id: '1',
        name: 'Sample {{feature_name_pascal}}',
        description: 'This is a sample {{feature_name.snakeCase()}} data',
        createdAt: DateTime.now(),
      );
{{/include_repository}}
      
      state = state.copyWith(
        data: data,
        isLoading: false,
      );
{{#include_error_handling}}
    } catch (error, stackTrace) {
{{#include_logger}}
      _logger.e('Error loading {{feature_name.snakeCase()}} data', error: error, stackTrace: stackTrace);
{{/include_logger}}
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
{{/include_error_handling}}
  }

  Future<void> _handleRefresh() async {
    await _handleLoad();
  }

  Future<void> _handleCreate(String name, String? description) async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      final newData = await repository.create{{feature_name_pascal}}Data(name, description);
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      final newData = {{feature_name_pascal}}Data(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        description: description,
        createdAt: DateTime.now(),
      );
{{/include_repository}}
      
      state = state.copyWith(
        data: newData,
        isLoading: false,
      );
{{#include_error_handling}}
    } catch (error, stackTrace) {
{{#include_logger}}
      _logger.e('Error creating {{feature_name.snakeCase()}} data', error: error, stackTrace: stackTrace);
{{/include_logger}}
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
{{/include_error_handling}}
  }

  Future<void> _handleUpdate(String id, String name, String? description) async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      final updatedData = await repository.update{{feature_name_pascal}}Data(id, name, description);
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      final updatedData = state.data?.copyWith(
        name: name,
        description: description,
      );
{{/include_repository}}
      
      state = state.copyWith(
        data: updatedData,
        isLoading: false,
      );
{{#include_error_handling}}
    } catch (error, stackTrace) {
{{#include_logger}}
      _logger.e('Error updating {{feature_name.snakeCase()}} data', error: error, stackTrace: stackTrace);
{{/include_logger}}
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
{{/include_error_handling}}
  }

  Future<void> _handleDelete(String id) async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      await repository.delete{{feature_name_pascal}}Data(id);
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
{{/include_repository}}
      
      state = state.copyWith(
        data: null,
        isLoading: false,
      );
{{#include_error_handling}}
    } catch (error, stackTrace) {
{{#include_logger}}
      _logger.e('Error deleting {{feature_name.snakeCase()}} data', error: error, stackTrace: stackTrace);
{{/include_logger}}
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
{{/include_error_handling}}
  }

  void _handleClear() {
    state = const {{feature_name_pascal}}State();
  }
{{/custom}}
{{#list}}
  Future<void> _handleLoadItems() async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      final items = await repository.load{{feature_name_pascal}}Items();
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      final items = [
        {{feature_name_pascal}}Item(
          id: '1',
          title: 'Sample Item 1',
          subtitle: 'This is the first sample item',
        ),
        {{feature_name_pascal}}Item(
          id: '2',
          title: 'Sample Item 2',
          subtitle: 'This is the second sample item',
          isCompleted: true,
        ),
      ];
{{/include_repository}}
      
      state = state.copyWith(
        items: items,
        isLoading: false,
      );
{{#include_error_handling}}
    } catch (error, stackTrace) {
{{#include_logger}}
      _logger.e('Error loading {{feature_name.snakeCase()}} items', error: error, stackTrace: stackTrace);
{{/include_logger}}
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
{{/include_error_handling}}
  }

  Future<void> _handleRefreshItems() async {
    await _handleLoadItems();
  }

  Future<void> _handleAddItem(String title, String? subtitle) async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      final newItem = await repository.add{{feature_name_pascal}}Item(title, subtitle);
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      final newItem = {{feature_name_pascal}}Item(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        subtitle: subtitle,
      );
{{/include_repository}}
      
      state = state.copyWith(
        items: [...state.items, newItem],
        isLoading: false,
      );
{{#include_error_handling}}
    } catch (error, stackTrace) {
{{#include_logger}}
      _logger.e('Error adding {{feature_name.snakeCase()}} item', error: error, stackTrace: stackTrace);
{{/include_logger}}
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
{{/include_error_handling}}
  }

  Future<void> _handleUpdateItem(String id, String? title, String? subtitle, bool? isCompleted) async {
{{#include_error_handling}}
    try {
{{/include_error_handling}}
      state = state.copyWith(isLoading: true, error: null);
      
      final updatedItems = state.items.map((item) {
        if (item.id == id) {
          return item.copyWith(
            title: title ?? item.title,
            subtitle: subtitle ?? item.subtitle,
            isCompleted: isCompleted ?? item.isCompleted,
          );
        }
        return item;
      }).toList();
      
{{#include_repository}}
      final repository = ref.read({{feature_name_camel}}RepositoryProvider);
      await repository.update{{feature_name_pascal}}Item(id, title, subtitle, isCompleted);
{{/include_repository}}
{{^include_repository}}
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 300));
{{/include_repository}}
      
      state =