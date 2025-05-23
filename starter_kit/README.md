<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Flutter Starter Kit

A comprehensive, scalable, and production-ready Flutter boilerplate generator with clean architecture.

## Overview

Flutter Starter Kit is a powerful tool designed to accelerate Flutter development by providing a complete project structure following clean architecture principles. It includes pre-integrated essential Flutter packages, a WeChat-inspired design system, and CLI tools to automate the generation of screens, APIs, localization, and more.

The goal is to provide developers with a zero-configuration, scalable project starter that is production-ready out of the box and highly extensible for both small and enterprise-level applications.

## Features

- 🧱 **Clean Architecture Structure**: Domain, Data, and Presentation layers with clear separation of concerns
- 🎨 **WeChat-Inspired Design System**: Beautiful, consistent UI components ready to use
- 🌐 **Networking Layer**: Configured Dio client with interceptors and error handling
- 🔄 **State Management**: Support for both BLoC and Riverpod patterns
- 💉 **Dependency Injection**: Set up with get_it and injectable
- 🌍 **Internationalization**: Built-in localization support
- 🧪 **Testing Setup**: Preconfigured unit, widget, and integration tests
- 🔐 **Error Handling**: Unified error handling architecture
- 🚀 **CLI Tools**: Generate screens, APIs, and more with simple commands

## Installation

```bash
flutter pub global activate starter_kit
```

Or add it to your `pubspec.yaml` for use as a development dependency:

```yaml
dev_dependencies:
  starter_kit: ^0.0.1
```

## Usage

### Creating a New Project

```bash
flutter pub run starter_kit:init
```

This command creates a complete project structure with all the necessary configurations.

### Generating a New Screen

```bash
flutter pub run starter_kit:add_screen login
```

This generates a new screen with related files (screen, bloc/controller, repository, etc.).

### Adding an API Endpoint

```bash
flutter pub run starter_kit:add_api users
```

This generates API-related files for a specific endpoint.

### Generating Asset References

```bash
flutter pub run starter_kit:generate_assets
```

This creates references for all assets in your project.

### Updating Localization Files

```bash
flutter pub run starter_kit:update_localization
```

This updates and syncs all localization keys across language files.

### Adding a Feature Module

```bash
flutter pub run starter_kit:add_module auth
```

This adds a new feature module with all necessary components.

## Project Structure

```
lib/
└── src/
    ├── core/              → Global configs (theme, localization, DI, logger, utilities)
    ├── data/              → DTOs, models, API clients (Dio), remote/local sources
    ├── domain/            → Entities, repository interfaces, use cases
    └── presentation/      → UI screens, widgets, state management, routes

assets/
├── images/
├── icons/
└── lang/                 → Localization files (en.json, fr.json, etc.)

test/                     → Unit and widget tests
integration_test/         → Full app integration testing
```

## Design System

The included design system provides:

- Color palette and typography system
- Buttons, text fields, cards, and other UI components
- Spacing and responsive utilities
- Light and dark theme support

## Pre-installed Dependencies

- **Networking**: dio, connectivity_plus
- **State Management**: flutter_bloc, equatable, riverpod, flutter_riverpod
- **Dependency Injection**: get_it, injectable
- **Model Generation**: json_annotation, freezed_annotation
- **UI Components**: flutter_svg, cached_network_image, shimmer, flutter_spinkit
- **Utilities**: logger, intl, path_provider, shared_preferences, url_launcher, package_info_plus, device_info_plus, uuid
- **Testing**: mockito, bloc_test, riverpod_test

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
