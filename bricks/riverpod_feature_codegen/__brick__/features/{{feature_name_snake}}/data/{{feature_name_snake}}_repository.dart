import 'package:riverpod_annotation/riverpod_annotation.dart';
{{#include_logger}}import 'package:logger/logger.dart';{{/include_logger}}
{{#has_async_state}}import 'dart:convert';
import 'package:http/http.dart' as http;{{/has_async_state}}

import '../presentation/state/{{feature_name_snake}}_state.dart';

part '{{feature_name_snake}}_repository.g.dart';

abstract class {{feature_name_pascal}}Repository {
{{#state_type}}
{{#simple}}
  Future<int> getValue();
  Future<void> setValue(int value);
  Future<void> resetValue();
{{/simple}}
{{#custom}}
  Future<{{feature_name_pascal}}Data?> load{{feature_name_pascal}}Data();
  Future<{{feature_name_pascal}}Data> create{{feature_name_pascal}}Data(String name, String? description);
  Future<{{feature_name_pascal}}Data> update{{feature_name_pascal}}Data(String id, String name, String? description);
  Future<void> delete{{feature_name_pascal}}Data(String id);
{{/custom}}
{{#list}}
  Future<List<{{feature_name_pascal}}Item>> load{{feature_name_pascal}}Items();
  Future<{{feature_name_pascal}}Item> add{{feature_name_pascal}}Item(String title, String? subtitle);
  Future<void> update{{feature_name_pascal}}Item(String id, String? title, String? subtitle, bool? isCompleted);
  Future<void> delete{{feature_name_pascal}}Item(String id);
{{/list}}
{{/state_type}}
}

class {{feature_name_pascal}}RepositoryImpl implements {{feature_name_pascal}}Repository {
{{#include_logger}}
  final _logger = Logger();
{{/include_logger}}
{{#has_async_state}}
  final String _baseUrl;
  final http.Client _httpClient;

  {{feature_name_pascal}}RepositoryImpl({
    String? baseUrl,
    http.Client? httpClient,
  }) : _baseUrl = baseUrl ?? 'https://api.example.com',
       _httpClient = httpClient ?? http.Client();
{{/has_async_state}}

{{#state_type}}
{{#simple}}
  @override
  Future<int> getValue() async {
{{#include_logger}}
    _logger.d('Getting {{feature_name_snake}} value');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.get(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/value'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['value'] as int;
      } else {
        throw Exception('Failed to get value: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error getting {{feature_name_snake}} value', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate local storage or simple async operation
    await Future.delayed(const Duration(milliseconds: 100));
    return 0; // Default value
{{/has_async_state}}
  }

  @override
  Future<void> setValue(int value) async {
{{#include_logger}}
    _logger.d('Setting {{feature_name_snake}} value to $value');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/value'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'value': value}),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to set value: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error setting {{feature_name_snake}} value', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate local storage or simple async operation
    await Future.delayed(const Duration(milliseconds: 100));
{{/has_async_state}}
  }

  @override
  Future<void> resetValue() async {
{{#include_logger}}
    _logger.d('Resetting {{feature_name_snake}} value');
{{/include_logger}}
    await setValue(0);
  }
{{/simple}}
{{#custom}}
  @override
  Future<{{feature_name_pascal}}Data?> load{{feature_name_pascal}}Data() async {
{{#include_logger}}
    _logger.d('Loading {{feature_name_snake}} data');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.get(
        Uri.parse('$_baseUrl/{{feature_name_snake}}'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {{feature_name_pascal}}Data.fromJson(data);
      } else if (response.statusCode == 404) {
        return null;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error loading {{feature_name_snake}} data', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(seconds: 1));
    return {{feature_name_pascal}}Data(
      id: '1',
      name: 'Sample {{feature_name_pascal}}',
      description: 'This is a sample {{feature_name_snake}} data',
      createdAt: DateTime.now(),
    );
{{/has_async_state}}
  }

  @override
  Future<{{feature_name_pascal}}Data> create{{feature_name_pascal}}Data(String name, String? description) async {
{{#include_logger}}
    _logger.d('Creating {{feature_name_snake}} data: $name');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/{{feature_name_snake}}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'description': description,
        }),
      );
      
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return {{feature_name_pascal}}Data.fromJson(data);
      } else {
        throw Exception('Failed to create data: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error creating {{feature_name_snake}} data', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 500));
    return {{feature_name_pascal}}Data(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      createdAt: DateTime.now(),
    );
{{/has_async_state}}
  }

  @override
  Future<{{feature_name_pascal}}Data> update{{feature_name_pascal}}Data(String id, String name, String? description) async {
{{#include_logger}}
    _logger.d('Updating {{feature_name_snake}} data: $id');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.put(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'description': description,
        }),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {{feature_name_pascal}}Data.fromJson(data);
      } else {
        throw Exception('Failed to update data: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error updating {{feature_name_snake}} data', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 500));
    return {{feature_name_pascal}}Data(
      id: id,
      name: name,
      description: description,
      createdAt: DateTime.now(),
    );
{{/has_async_state}}
  }

  @override
  Future<void> delete{{feature_name_pascal}}Data(String id) async {
{{#include_logger}}
    _logger.d('Deleting {{feature_name_snake}} data: $id');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.delete(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/$id'),
      );
      
      if (response.statusCode != 204) {
        throw Exception('Failed to delete data: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error deleting {{feature_name_snake}} data', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 300));
{{/has_async_state}}
  }
{{/custom}}
{{#list}}
  @override
  Future<List<{{feature_name_pascal}}Item>> load{{feature_name_pascal}}Items() async {
{{#include_logger}}
    _logger.d('Loading {{feature_name_snake}} items');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.get(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/items'),
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => {{feature_name_pascal}}Item.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load items: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error loading {{feature_name_snake}} items', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(seconds: 1));
    return [
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
{{/has_async_state}}
  }

  @override
  Future<{{feature_name_pascal}}Item> add{{feature_name_pascal}}Item(String title, String? subtitle) async {
{{#include_logger}}
    _logger.d('Adding {{feature_name_snake}} item: $title');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/items'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': title,
          'subtitle': subtitle,
        }),
      );
      
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return {{feature_name_pascal}}Item.fromJson(data);
      } else {
        throw Exception('Failed to add item: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error adding {{feature_name_snake}} item', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 500));
    return {{feature_name_pascal}}Item(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      subtitle: subtitle,
    );
{{/has_async_state}}
  }

  @override
  Future<void> update{{feature_name_pascal}}Item(String id, String? title, String? subtitle, bool? isCompleted) async {
{{#include_logger}}
    _logger.d('Updating {{feature_name_snake}} item: $id');
{{/include_logger}}
{{#has_async_state}}
    try {
      final updateData = <String, dynamic>{};
      if (title != null) updateData['title'] = title;
      if (subtitle != null) updateData['subtitle'] = subtitle;
      if (isCompleted != null) updateData['isCompleted'] = isCompleted;

      final response = await _httpClient.patch(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/items/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updateData),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to update item: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error updating {{feature_name_snake}} item', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 300));
{{/has_async_state}}
  }

  @override
  Future<void> delete{{feature_name_pascal}}Item(String id) async {
{{#include_logger}}
    _logger.d('Deleting {{feature_name_snake}} item: $id');
{{/include_logger}}
{{#has_async_state}}
    try {
      final response = await _httpClient.delete(
        Uri.parse('$_baseUrl/{{feature_name_snake}}/items/$id'),
      );
      
      if (response.statusCode != 204) {
        throw Exception('Failed to delete item: ${response.statusCode}');
      }
    } catch (e) {
{{#include_logger}}
      _logger.e('Error deleting {{feature_name_snake}} item', error: e);
{{/include_logger}}
      rethrow;
    }
{{/has_async_state}}
{{^has_async_state}}
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 300));
{{/has_async_state}}
  }
{{/list}}
{{/state_type}}
}

@riverpod
{{feature_name_pascal}}Repository {{feature_name_camel}}Repository({{feature_name_pascal}}RepositoryRef ref) {
  return {{feature_name_pascal}}RepositoryImpl();
}