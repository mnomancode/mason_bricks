{{#use_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature_name.snakeCase()}}_state.freezed.dart';
{{#has_async_state}}part '{{feature_name.snakeCase()}}_state.g.dart';{{/has_async_state}}

@freezed
class {{feature_name_pascal}}State with _${{feature_name_pascal}}State {
{{#state_type}}
{{#simple}}
  const factory {{feature_name_pascal}}State({
    @Default(0) int value,
    @Default(false) bool isLoading,
    String? error,
  }) = _{{feature_name_pascal}}State;
{{/simple}}
{{#custom}}
  const factory {{feature_name_pascal}}State({
    {{feature_name_pascal}}Data? data,
    @Default(false) bool isLoading,
    String? error,
  }) = _{{feature_name_pascal}}State;
{{/custom}}
{{#list}}
  const factory {{feature_name_pascal}}State({
    @Default([]) List<{{feature_name_pascal}}Item> items,
    @Default(false) bool isLoading,
    String? error,
  }) = _{{feature_name_pascal}}State;
{{/list}}
{{/state_type}}

{{#has_async_state}}
  factory {{feature_name_pascal}}State.fromJson(Map<String, dynamic> json) =>
      _${{feature_name_pascal}}StateFromJson(json);
{{/has_async_state}}
}

{{#state_type}}
{{#custom}}
@freezed
class {{feature_name_pascal}}Data with _${{feature_name_pascal}}Data {
  const factory {{feature_name_pascal}}Data({
    required String id,
    required String name,
    String? description,
    DateTime? createdAt,
  }) = _{{feature_name_pascal}}Data;

  factory {{feature_name_pascal}}Data.fromJson(Map<String, dynamic> json) =>
      _${{feature_name_pascal}}DataFromJson(json);
}
{{/custom}}
{{#list}}
@freezed
class {{feature_name_pascal}}Item with _${{feature_name_pascal}}Item {
  const factory {{feature_name_pascal}}Item({
    required String id,
    required String title,
    String? subtitle,
    @Default(false) bool isCompleted,
  }) = _{{feature_name_pascal}}Item;

  factory {{feature_name_pascal}}Item.fromJson(Map<String, dynamic> json) =>
      _${{feature_name_pascal}}ItemFromJson(json);
}
{{/list}}
{{/state_type}}
{{/use_freezed}}
{{^use_freezed}}
{{#state_type}}
{{#simple}}
class {{feature_name_pascal}}State {
  final int value;
  final bool isLoading;
  final String? error;

  const {{feature_name_pascal}}State({
    this.value = 0,
    this.isLoading = false,
    this.error,
  });

  {{feature_name_pascal}}State copyWith({
    int? value,
    bool? isLoading,
    String? error,
  }) {
    return {{feature_name_pascal}}State(
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
{{/simple}}
{{#custom}}
class {{feature_name_pascal}}State {
  final {{feature_name_pascal}}Data? data;
  final bool isLoading;
  final String? error;

  const {{feature_name_pascal}}State({
    this.data,
    this.isLoading = false,
    this.error,
  });

  {{feature_name_pascal}}State copyWith({
    {{feature_name_pascal}}Data? data,
    bool? isLoading,
    String? error,
  }) {
    return {{feature_name_pascal}}State(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class {{feature_name_pascal}}Data {
  final String id;
  final String name;
  final String? description;
  final DateTime? createdAt;

  const {{feature_name_pascal}}Data({
    required this.id,
    required this.name,
    this.description,
    this.createdAt,
  });

  {{feature_name_pascal}}Data copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
  }) {
    return {{feature_name_pascal}}Data(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory {{feature_name_pascal}}Data.fromJson(Map<String, dynamic> json) {
    return {{feature_name_pascal}}Data(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }
}
{{/custom}}
{{#list}}
class {{feature_name_pascal}}State {
  final List<{{feature_name_pascal}}Item> items;
  final bool isLoading;
  final String? error;

  const {{feature_name_pascal}}State({
    this.items = const [],
    this.isLoading = false,
    this.error,
  });

  {{feature_name_pascal}}State copyWith({
    List<{{feature_name_pascal}}Item>? items,
    bool? isLoading,
    String? error,
  }) {
    return {{feature_name_pascal}}State(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class {{feature_name_pascal}}Item {
  final String id;
  final String title;
  final String? subtitle;
  final bool isCompleted;

  const {{feature_name_pascal}}Item({
    required this.id,
    required this.title,
    this.subtitle,
    this.isCompleted = false,
  });

  {{feature_name_pascal}}Item copyWith({
    String? id,
    String? title,
    String? subtitle,
    bool? isCompleted,
  }) {
    return {{feature_name_pascal}}Item(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'isCompleted': isCompleted,
    };
  }

  factory {{feature_name_pascal}}Item.fromJson(Map<String, dynamic> json) {
    return {{feature_name_pascal}}Item(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}
{{/list}}
{{/state_type}}
{{/use_freezed}}