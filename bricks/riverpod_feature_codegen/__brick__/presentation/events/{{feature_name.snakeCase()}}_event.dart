// Sample: Events for counter app
enum {{feature_name.pascalCase()}}Event {
  increment,
  decrement,
  reset,
}

// Sample: Event extensions for additional functionality
extension {{feature_name.pascalCase()}}EventX on {{feature_name.pascalCase()}}Event {
  String get displayName {
    switch (this) {
      case {{feature_name.pascalCase()}}Event.increment:
        return 'Increment';
      case {{feature_name.pascalCase()}}Event.decrement:
        return 'Decrement';
      case {{feature_name.pascalCase()}}Event.reset:
        return 'Reset';
    }
  }

  bool get isModifying {
    switch (this) {
      case {{feature_name.pascalCase()}}Event.increment:
      case {{feature_name.pascalCase()}}Event.decrement:
        return true;
      case {{feature_name.pascalCase()}}Event.reset:
        return false;
    }
  }
}