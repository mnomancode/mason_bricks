import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final useFreezed = context.vars['use_freezed'] as bool;
  final includeRepository = context.vars['include_repository'] as bool;
  final hasAsyncState = context.vars['has_async_state'] as bool;

  // Convert feature name to different cases
  context.vars = {
    ...context.vars,
    'feature_name_pascal': featureName.pascalCase,
    'feature_name_camel': featureName.camelCase,
    'feature_name_snake': featureName.snakeCase,
    'feature_name_kebab': featureName.paramCase,
  };

  final progress = context.logger
      .progress('Generating ${context.vars['feature_name_pascal']} feature');

  // Show generation summary
  final buffer = StringBuffer()
    ..writeln(
        '🚀 Generating Riverpod feature: ${context.vars['feature_name_pascal']}')
    ..writeln('📝 Description: ${context.vars['feature_description']}')
    ..writeln('⚡ Async State: ${hasAsyncState ? 'Yes' : 'No'}')
    ..writeln('❄️  Freezed: ${useFreezed ? 'Yes' : 'No'}')
    ..writeln('🏪 Repository: ${includeRepository ? 'Yes' : 'No'}')
    ..writeln('📊 State Type: ${context.vars['state_type']}');

  progress.complete(
      'Generated ${context.vars['feature_name_pascal']} feature successfully!');

  context.logger.info(buffer.toString());

  // Next steps
  context.logger.info('');
  context.logger.info('Next steps:');
  context.logger.info('1. Run: dart pub get');
  context.logger.info('2. Run: dart run build_runner build');
  context.logger.info('3. Import your feature in the main app');
}
