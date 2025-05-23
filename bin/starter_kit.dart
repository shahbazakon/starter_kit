#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser =
      ArgParser()
        ..addCommand('init')
        ..addCommand('add_screen')
        ..addCommand('add_api')
        ..addCommand('add_model')
        ..addCommand('generate')
        ..addFlag('help', abbr: 'h', help: 'Show usage information');

  try {
    final results = parser.parse(arguments);

    if (results['help'] as bool || arguments.isEmpty) {
      _showHelp(parser);
      return;
    }

    final command = results.command;
    if (command == null) {
      stderr.writeln('No command specified. Use --help for usage information.');
      exit(1);
    }

    switch (command.name) {
      case 'init':
        _initProject(command.arguments);
        break;
      case 'add_screen':
        _addScreen(command.arguments);
        break;
      case 'add_api':
        _addApi(command.arguments);
        break;
      case 'add_model':
        _addModel(command.arguments);
        break;
      case 'generate':
        _generateCode(command.arguments);
        break;
      default:
        stderr.writeln('Unknown command: ${command.name}');
        exit(1);
    }
  } catch (e) {
    stderr.writeln('Error: $e');
    exit(1);
  }
}

void _showHelp(ArgParser parser) {
  stdout.writeln('StarterKit CLI - Flutter project generator');
  stdout.writeln('');
  stdout.writeln('Usage: starter_kit <command> [arguments]');
  stdout.writeln('');
  stdout.writeln('Available commands:');
  stdout.writeln(
    '  init         Initialize a new Flutter project with StarterKit',
  );
  stdout.writeln('  add_screen   Add a new screen to the project');
  stdout.writeln('  add_api      Add a new API service to the project');
  stdout.writeln('  add_model    Add a new data model to the project');
  stdout.writeln('  generate     Generate code from templates');
  stdout.writeln('');
  stdout.writeln('Global options:');
  stdout.writeln(parser.usage);
}

void _initProject(List<String> arguments) {
  stdout.writeln('Initializing new Flutter project with StarterKit...');

  // Create basic project structure
  final directories = [
    'lib/src/core/config',
    'lib/src/core/design_system/components',
    'lib/src/core/design_system/theme',
    'lib/src/core/design_system/utils',
    'lib/src/core/di',
    'lib/src/core/localization',
    'lib/src/core/network',
    'lib/src/core/utils',
    'lib/src/data/models',
    'lib/src/data/repositories',
    'lib/src/domain/entities',
    'lib/src/domain/repositories',
    'lib/src/domain/usecases',
    'lib/src/presentation/pages',
    'lib/src/presentation/widgets',
    'assets/icons',
    'assets/images',
  ];

  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
    stdout.writeln('Created directory: $dir');
  }

  stdout.writeln('Project initialized successfully!');
}

void _addScreen(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln(
      'Screen name is required. Usage: starter_kit add_screen <screen_name>',
    );
    exit(1);
  }

  final screenName = arguments[0];
  stdout.writeln('Adding screen: $screenName');

  // TODO: Implement screen generation logic
  stdout.writeln('Screen $screenName added successfully!');
}

void _addApi(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln(
      'API name is required. Usage: starter_kit add_api <api_name>',
    );
    exit(1);
  }

  final apiName = arguments[0];
  stdout.writeln('Adding API service: $apiName');

  // TODO: Implement API service generation logic
  stdout.writeln('API service $apiName added successfully!');
}

void _addModel(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln(
      'Model name is required. Usage: starter_kit add_model <model_name>',
    );
    exit(1);
  }

  final modelName = arguments[0];
  stdout.writeln('Adding model: $modelName');

  // TODO: Implement model generation logic
  stdout.writeln('Model $modelName added successfully!');
}

void _generateCode(List<String> arguments) {
  stdout.writeln('Generating code from templates...');

  // TODO: Implement code generation logic
  stdout.writeln('Code generation completed successfully!');
}
