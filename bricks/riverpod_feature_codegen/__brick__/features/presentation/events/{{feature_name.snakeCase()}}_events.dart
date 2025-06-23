{{#use_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature_name.snakeCase()}}_events.freezed.dart';

@freezed
class {{feature_name_pascal}}Event with _${{feature_name_pascal}}Event {
{{#state_type}}
{{#simple}}
  const factory {{feature_name_pascal}}Event.increment() = {{feature_name_pascal}}IncrementEvent;
  const factory {{feature_name_pascal}}Event.decrement() = {{feature_name_pascal}}DecrementEvent;
  const factory {{feature_name_pascal}}Event.reset() = {{feature_name_pascal}}ResetEvent;
  const factory {{feature_name_pascal}}Event.setValue(int value) = {{feature_name_pascal}}SetValueEvent;
{{/simple}}
{{#custom}}
  const factory {{feature_name_pascal}}Event.load() = {{feature_name_pascal}}LoadEvent;
  const factory {{feature_name_pascal}}Event.refresh() = {{feature_name_pascal}}RefreshEvent;
  const factory {{feature_name_pascal}}Event.create(String name, {String? description}) = {{feature_name_pascal}}CreateEvent;
  const factory {{feature_name_pascal}}Event.update(String id, String name, {String? description}) = {{feature_name_pascal}}UpdateEvent;
  const factory {{feature_name_pascal}}Event.delete(String id) = {{feature_name_pascal}}DeleteEvent;
  const factory {{feature_name_pascal}}Event.clear() = {{feature_name_pascal}}ClearEvent;
{{/custom}}
{{#list}}
  const factory {{feature_name_pascal}}Event.loadItems() = {{feature_name_pascal}}LoadItemsEvent;
  const factory {{feature_name_pascal}}Event.refreshItems() = {{feature_name_pascal}}RefreshItemsEvent;
  const factory {{feature_name_pascal}}Event.addItem(String title, {String? subtitle}) = {{feature_name_pascal}}AddItemEvent;
  const factory {{feature_name_pascal}}Event.updateItem(String id, {String? title, String? subtitle, bool? isCompleted}) = {{feature_name_pascal}}UpdateItemEvent;
  const factory {{feature_name_pascal}}Event.deleteItem(String id) = {{feature_name_pascal}}DeleteItemEvent;
  const factory {{feature_name_pascal}}Event.toggleItem(String id) = {{feature_name_pascal}}ToggleItemEvent;
  const factory {{feature_name_pascal}}Event.clearCompleted() = {{feature_name_pascal}}ClearCompletedEvent;
{{/list}}
{{/state_type}}
}
{{/use_freezed}}
{{^use_freezed}}
abstract class {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}Event();
}

{{#state_type}}
{{#simple}}
class {{feature_name_pascal}}IncrementEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}IncrementEvent();
}

class {{feature_name_pascal}}DecrementEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}DecrementEvent();
}

class {{feature_name_pascal}}ResetEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}ResetEvent();
}

class {{feature_name_pascal}}SetValueEvent extends {{feature_name_pascal}}Event {
  final int value;
  
  const {{feature_name_pascal}}SetValueEvent(this.value);
}
{{/simple}}
{{#custom}}
class {{feature_name_pascal}}LoadEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}LoadEvent();
}

class {{feature_name_pascal}}RefreshEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}RefreshEvent();
}

class {{feature_name_pascal}}CreateEvent extends {{feature_name_pascal}}Event {
  final String name;
  final String? description;
  
  const {{feature_name_pascal}}CreateEvent(this.name, {this.description});
}

class {{feature_name_pascal}}UpdateEvent extends {{feature_name_pascal}}Event {
  final String id;
  final String name;
  final String? description;
  
  const {{feature_name_pascal}}UpdateEvent(this.id, this.name, {this.description});
}

class {{feature_name_pascal}}DeleteEvent extends {{feature_name_pascal}}Event {
  final String id;
  
  const {{feature_name_pascal}}DeleteEvent(this.id);
}

class {{feature_name_pascal}}ClearEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}ClearEvent();
}
{{/custom}}
{{#list}}
class {{feature_name_pascal}}LoadItemsEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}LoadItemsEvent();
}

class {{feature_name_pascal}}RefreshItemsEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}RefreshItemsEvent();
}

class {{feature_name_pascal}}AddItemEvent extends {{feature_name_pascal}}Event {
  final String title;
  final String? subtitle;
  
  const {{feature_name_pascal}}AddItemEvent(this.title, {this.subtitle});
}

class {{feature_name_pascal}}UpdateItemEvent extends {{feature_name_pascal}}Event {
  final String id;
  final String? title;
  final String? subtitle;
  final bool? isCompleted;
  
  const {{feature_name_pascal}}UpdateItemEvent(this.id, {this.title, this.subtitle, this.isCompleted});
}

class {{feature_name_pascal}}DeleteItemEvent extends {{feature_name_pascal}}Event {
  final String id;
  
  const {{feature_name_pascal}}DeleteItemEvent(this.id);
}

class {{feature_name_pascal}}ToggleItemEvent extends {{feature_name_pascal}}Event {
  final String id;
  
  const {{feature_name_pascal}}ToggleItemEvent(this.id);
}

class {{feature_name_pascal}}ClearCompletedEvent extends {{feature_name_pascal}}Event {
  const {{feature_name_pascal}}ClearCompletedEvent();
}
{{/list}}
{{/state_type}}
{{/use_freezed}}