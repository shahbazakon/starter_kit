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

# StarterKit - Flutter Boilerplate Generator

🚀 **A comprehensive Flutter package for rapid project initialization and boilerplate generation.**

StarterKit is designed to eliminate the repetitive setup phase of Flutter projects by providing a complete, production-ready boilerplate with clean architecture, beautiful design system, and essential utilities.

## 🎯 Objective

This package serves as a **helper for initializing and creating new modules and projects from scratch**. It generates all the basic code required for Flutter projects in the initial phase, enabling developers to build applications in rapid form.

## ✨ Features

### 🏗️ Complete Boilerplate Generation
- **Clean Architecture Structure** - Domain, Data, Presentation layers
- **WeChat-inspired Design System** - Colors, Typography, Theme
- **Network Layer** - API Client with error handling
- **Utilities** - String, Date, Validators, Device info
- **Dependency Injection** - Get_it setup with environment configs
- **Localization Support** - Multi-language ready
- **Test Structure** - Unit, Widget, Integration test folders

### 🛠️ CLI Tools
- **Smart Code Generation** - Screens, APIs, Models with tests
- **Minimal Commands** - Maximum functionality with simple syntax
- **Template-based** - Consistent, maintainable code generation

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  starter_kit:
    git:
      url: https://github.com/your-repo/starter_kit.git
```

Then run:
```bash
flutter pub get
```

## 🚀 CLI Usage

### Initialize Complete Boilerplate

```bash
dart run starter_kit init
```

This single command generates:
- ✅ Complete Design System (Colors, Typography, Theme)
- ✅ Network Layer (API Client, Response Models)
- ✅ Utility Functions (String, Date, Validators)
- ✅ Dependency Injection Setup
- ✅ Localization Support
- ✅ Clean Architecture Structure
- ✅ Test Directories

### Generate New Screen

```bash
dart run starter_kit add_screen LoginScreen
```

Creates:
- `lib/src/presentation/pages/login_screen.dart` - Screen widget
- `test/widget/login_screen_test.dart` - Widget tests

### Generate API Service

```bash
dart run starter_kit add_api UserService
```

Creates:
- `lib/src/data/repositories/user_service_repository.dart` - Repository implementation
- `lib/src/domain/repositories/user_service_repository.dart` - Repository interface
- `test/unit/user_service_repository_test.dart` - Unit tests

### Generate Data Model

```bash
dart run starter_kit add_model User
```

Creates:
- `lib/src/data/models/user.dart` - Data model with JSON serialization
- `lib/src/domain/entities/user.dart` - Domain entity
- `test/unit/user_test.dart` - Model tests

## 🏃‍♂️ Quick Start

1. **Initialize your project**:
   ```bash
   dart run starter_kit init
   ```

2. **Add starter_kit to your pubspec.yaml**:
   ```yaml
   dependencies:
     starter_kit:
       path: ../starter_kit  # or your git URL
   ```

3. **Import in your main.dart**:
   ```dart
   import 'package:starter_kit/starter_kit.dart';
   
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     
     // Initialize dependency injection
     await configureDependencies(environment: 'dev');
     
     runApp(MyApp());
   }
   ```

4. **Use the generated components**:
   ```dart
   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: 'My App',
         theme: AppTheme.lightTheme,  // Generated theme
         home: MyHomePage(),
       );
     }
   }
   ```

## 🎨 Generated Design System

The CLI generates a complete WeChat-inspired design system:

### Colors
```dart
AppColors.primary        // #07C160 (WeChat Green)
AppColors.secondary      // #576B95 (WeChat Blue)
AppColors.textPrimary    // Dark text
AppColors.textSecondary  // Secondary text
AppColors.background     // Light background
// ... and many more
```

### Typography
```dart
AppTextStyles.h1         // Large headings
AppTextStyles.h2         // Medium headings
AppTextStyles.bodyLarge  // Body text
AppTextStyles.bodyMedium // Medium body text
AppTextStyles.caption    // Small text
// ... complete typography scale
```

### Components
```dart
// Buttons
PrimaryButton(text: 'Save', onPressed: () {})
SecondaryButton(text: 'Cancel', onPressed: () {})
OutlineButton(text: 'Edit', onPressed: () {})

// Cards
AppCard(child: YourWidget())
AppListCard(title: 'Title', subtitle: 'Subtitle')
AppStatusCard.success(title: 'Success', description: 'Done!')

// Inputs
AppTextField(labelText: 'Email', validator: Validators.email)
AppDropdownField<String>(items: items, onChanged: onChanged)
```

## 🌐 Network Layer

Complete API client with error handling:

```dart
// Get API client instance
final apiClient = get<ApiClient>();

// Make requests
final response = await apiClient.get<List<User>>('/users');
if (response.isSuccess) {
  final users = response.data;
  // Handle success
} else {
  // Handle error: response.errorMessage
}
```

## 🛠️ Utilities

### String Utilities
```dart
StringUtils.capitalize('hello world')        // 'Hello world'
StringUtils.toCamelCase('hello world')       // 'helloWorld' 
StringUtils.toSnakeCase('HelloWorld')        // 'hello_world'
StringUtils.isEmail('test@example.com')      // true
StringUtils.truncate('Long text...', 10)     // 'Long te...'
```

### Date Utilities
```dart
AppDateUtils.formatDate(DateTime.now())                    // 'Mar 15, 2024'
AppDateUtils.formatRelativeTime(oneHourAgo)               // '1 hour ago'
AppDateUtils.isToday(DateTime.now())                      // true
AppDateUtils.formatDuration(Duration(hours: 2, minutes: 30)) // '2h 30m'
```

### Validators
```dart
// Use in forms
TextFormField(
  validator: Validators.email,  // Built-in email validation
)

TextFormField(
  validator: (value) => Validators.minLength(value, 8, fieldName: 'Password'),
)
```

## 🧪 Testing

Every generated component includes comprehensive tests:

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/widget/login_screen_test.dart
flutter test test/unit/user_service_repository_test.dart
```

## 📁 Generated Structure

```
lib/
├── src/
│   ├── core/
│   │   ├── config/           # App configuration
│   │   ├── design_system/    # Colors, Typography, Theme
│   │   ├── di/              # Dependency injection
│   │   ├── localization/    # Multi-language support
│   │   ├── network/         # API client
│   │   └── utils/           # Utilities & validators
│   ├── data/
│   │   ├── models/          # Data models
│   │   └── repositories/    # Repository implementations
│   ├── domain/
│   │   ├── entities/        # Domain entities  
│   │   └── repositories/    # Repository interfaces
│   └── presentation/
│       ├── pages/           # Screen widgets
│       └── widgets/         # Reusable widgets
test/
├── unit/                    # Unit tests
├── widget/                  # Widget tests
└── integration/             # Integration tests
```

## 🔧 Configuration

The generated `AppConfig` provides environment-specific settings:

```dart
class AppConfig {
  static const String appName = 'MyApp';
  static const String apiBaseUrl = 'https://api.example.com';
  static const bool isDebug = true;
  static const int apiTimeout = 30000;
}
```

## 🌍 Localization

Basic localization support is included:

```dart
// In your widget
final localizations = AppLocalizations.of(context);
Text(localizations.loading)  // 'Loading...' or 'Cargando...'
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🎉 Why StarterKit?

- ⚡ **Rapid Development** - Skip the boring setup, start building features
- 🏗️ **Clean Architecture** - Best practices built-in from day one  
- 🎨 **Beautiful Design** - WeChat-inspired design system
- 🧪 **Test Ready** - Comprehensive test structure included
- 🔧 **Customizable** - Easy to modify and extend
- 📱 **Production Ready** - Battle-tested patterns and utilities

**Stop writing boilerplate. Start building features.** 🚀
