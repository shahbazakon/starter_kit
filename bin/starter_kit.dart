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
        ..addFlag('help', abbr: 'h', help: 'Show usage information')
        ..addFlag('version', abbr: 'v', help: 'Show version information');

  try {
    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      _showHelp();
      return;
    }

    if (results['version'] as bool) {
      _showVersion();
      return;
    }

    if (arguments.isEmpty) {
      _showHelp();
      return;
    }

    final command = results.command;
    if (command == null) {
      stderr.writeln(
        '❌ No command specified. Use --help for usage information.',
      );
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
      default:
        stderr.writeln('❌ Unknown command: ${command.name}');
        exit(1);
    }
  } catch (e) {
    stderr.writeln('❌ Error: $e');
    exit(1);
  }
}

void _showHelp() {
  stdout.writeln('🚀 StarterKit CLI - Flutter Boilerplate Generator');
  stdout.writeln('');
  stdout.writeln(
    'Generate production-ready Flutter boilerplate code in seconds.',
  );
  stdout.writeln('');
  stdout.writeln('📋 Usage: dart run starter_kit <command> [arguments]');
  stdout.writeln('');
  stdout.writeln('🛠️  Commands:');
  stdout.writeln(
    '  init             🏗️  Initialize complete boilerplate structure',
  );
  stdout.writeln('  add_screen       📱 Generate new screen with tests');
  stdout.writeln(
    '  add_api          🌐 Generate API service with repository pattern',
  );
  stdout.writeln('  add_model        📦 Generate data model with entity');
  stdout.writeln('');
  stdout.writeln('🔧 Options:');
  stdout.writeln('  -h, --help       Show this help message');
  stdout.writeln('  -v, --version    Show version information');
  stdout.writeln('');
  stdout.writeln('📖 Examples:');
  stdout.writeln('  dart run starter_kit init');
  stdout.writeln('  dart run starter_kit add_screen LoginScreen');
  stdout.writeln('  dart run starter_kit add_api UserService');
  stdout.writeln('  dart run starter_kit add_model User');
  stdout.writeln('');
  stdout.writeln('💡 The init command generates all essential boilerplate:');
  stdout.writeln('   • Design System (Colors, Typography, Components)');
  stdout.writeln('   • Network Layer (API Client, Error Handling)');
  stdout.writeln('   • Utilities (Validators, String/Date helpers)');
  stdout.writeln('   • Dependency Injection');
  stdout.writeln('   • Localization Support');
  stdout.writeln('   • Clean Architecture Structure');
}

void _showVersion() {
  stdout.writeln('StarterKit CLI v1.0.0');
  stdout.writeln('Flutter boilerplate generator for rapid development');
}

void _initProject(List<String> arguments) {
  stdout.writeln(
    '🏗️  Initializing Flutter project with complete boilerplate...',
  );
  stdout.writeln('');

  // Create core directory structure
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
    'lib/src/presentation/pages',
    'lib/src/presentation/widgets',
    'assets/icons',
    'assets/images',
    'assets/fonts',
    'test/unit',
    'test/widget',
    'test/integration',
  ];

  stdout.writeln('📁 Creating directory structure...');
  for (final dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      stdout.writeln('  ✅ $dir');
    }
  }

  stdout.writeln('');
  stdout.writeln('⚙️  Generating core functionality...');

  // Generate all core files
  _generateCoreConfig();
  _generateDesignSystem();
  _generateNetworkLayer();
  _generateUtilities();
  _generateDependencyInjection();
  _generateLocalization();
  _generateMainExports();

  stdout.writeln('');
  stdout.writeln('🎉 Project initialization completed successfully!');
  stdout.writeln('');
  stdout.writeln('📝 Your boilerplate includes:');
  stdout.writeln('  ✅ Complete Design System (WeChat-inspired)');
  stdout.writeln('  ✅ Network Layer with Error Handling');
  stdout.writeln('  ✅ Utility Functions & Validators');
  stdout.writeln('  ✅ Dependency Injection Setup');
  stdout.writeln('  ✅ Multi-language Support');
  stdout.writeln('  ✅ Clean Architecture Structure');
  stdout.writeln('');
  stdout.writeln('🚀 Next steps:');
  stdout.writeln('  1. Add starter_kit to your pubspec.yaml dependencies');
  stdout.writeln('  2. Import: import "package:starter_kit/starter_kit.dart";');
  stdout.writeln('  3. Initialize DI: await configureDependencies();');
  stdout.writeln('  4. Start building with generated components!');
}

void _addScreen(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln('❌ Screen name is required.');
    stderr.writeln('📖 Usage: dart run starter_kit add_screen <ScreenName>');
    exit(1);
  }

  final screenName = arguments[0];
  final fileName = _toSnakeCase(screenName.replaceAll('Screen', ''));

  stdout.writeln('📱 Generating screen: $screenName');

  // Create screen file
  final screenContent = _generateScreenTemplate(screenName);
  final screenPath = 'lib/src/presentation/pages/${fileName}_screen.dart';
  _writeFile(screenPath, screenContent);
  stdout.writeln('  ✅ Screen: $screenPath');

  // Create test file
  final testContent = _generateScreenTestTemplate(screenName, fileName);
  final testPath = 'test/widget/${fileName}_screen_test.dart';
  _writeFile(testPath, testContent);
  stdout.writeln('  ✅ Test: $testPath');

  stdout.writeln('');
  stdout.writeln('🎉 Screen $screenName generated successfully!');
}

void _addApi(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln('❌ API service name is required.');
    stderr.writeln('📖 Usage: dart run starter_kit add_api <ServiceName>');
    exit(1);
  }

  final serviceName = arguments[0];
  final fileName = _toSnakeCase(serviceName.replaceAll('Service', ''));

  stdout.writeln('🌐 Generating API service: $serviceName');

  // Create repository implementation
  final repoContent = _generateRepositoryTemplate(serviceName, fileName);
  final repoPath = 'lib/src/data/repositories/${fileName}_repository.dart';
  _writeFile(repoPath, repoContent);
  stdout.writeln('  ✅ Repository: $repoPath');

  // Create repository interface
  final interfaceContent = _generateRepositoryInterfaceTemplate(
    serviceName,
    fileName,
  );
  final interfacePath =
      'lib/src/domain/repositories/${fileName}_repository.dart';
  _writeFile(interfacePath, interfaceContent);
  stdout.writeln('  ✅ Interface: $interfacePath');

  // Create test file
  final testContent = _generateApiTestTemplate(serviceName, fileName);
  final testPath = 'test/unit/${fileName}_repository_test.dart';
  _writeFile(testPath, testContent);
  stdout.writeln('  ✅ Test: $testPath');

  stdout.writeln('');
  stdout.writeln('🎉 API service $serviceName generated successfully!');
}

void _addModel(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln('❌ Model name is required.');
    stderr.writeln('📖 Usage: dart run starter_kit add_model <ModelName>');
    exit(1);
  }

  final modelName = arguments[0];
  final fileName = _toSnakeCase(modelName);

  stdout.writeln('📦 Generating model: $modelName');

  // Create model file
  final modelContent = _generateModelTemplate(modelName);
  final modelPath = 'lib/src/data/models/$fileName.dart';
  _writeFile(modelPath, modelContent);
  stdout.writeln('  ✅ Model: $modelPath');

  // Create entity file
  final entityContent = _generateEntityTemplate(modelName);
  final entityPath = 'lib/src/domain/entities/$fileName.dart';
  _writeFile(entityPath, entityContent);
  stdout.writeln('  ✅ Entity: $entityPath');

  // Create test file
  final testContent = _generateModelTestTemplate(modelName, fileName);
  final testPath = 'test/unit/${fileName}_test.dart';
  _writeFile(testPath, testContent);
  stdout.writeln('  ✅ Test: $testPath');

  stdout.writeln('');
  stdout.writeln('🎉 Model $modelName generated successfully!');
}

String _toSnakeCase(String text) {
  return text
      .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)}')
      .toLowerCase()
      .replaceAll(RegExp(r'^_'), '')
      .replaceAll(RegExp(r'_{2,}'), '_');
}

// Core generation methods
void _generateCoreConfig() {
  final content = '''/// Application configuration
class AppConfig {
  static const String appName = 'MyApp';
  static const String appVersion = '1.0.0';
  static const String apiBaseUrl = 'https://api.example.com';
  static const bool isDebug = true;
  static const int apiTimeout = 30000;
  
  // Environment configurations
  static String get environment => isDebug ? 'development' : 'production';
  
  // API configurations
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
''';
  _writeFile('lib/src/core/config/app_config.dart', content);
  stdout.writeln('  ✅ App Configuration');
}

void _generateDesignSystem() {
  // Generate Colors
  final colorsContent = '''import 'package:flutter/material.dart';

/// Application color palette inspired by WeChat design
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF07C160);
  static const Color primaryDark = Color(0xFF05A050);
  static const Color primaryLight = Color(0xFF4CD98B);
  
  // Secondary colors
  static const Color secondary = Color(0xFF576B95);
  static const Color secondaryDark = Color(0xFF3F5177);
  static const Color secondaryLight = Color(0xFF7A8BB5);
  
  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  
  // Text colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF8C8C8C);
  static const Color textTertiary = Color(0xFFBFBFBF);
  static const Color textDisabled = Color(0xFFD9D9D9);
  
  // Status colors
  static const Color success = Color(0xFF52C41A);
  static const Color warning = Color(0xFFFAAD14);
  static const Color error = Color(0xFFF5222D);
  static const Color info = Color(0xFF1890FF);
  
  // Border colors
  static const Color border = Color(0xFFE5E5E5);
  static const Color borderLight = Color(0xFFF0F0F0);
  static const Color borderDark = Color(0xFFD9D9D9);
  
  // Shadow colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowDark = Color(0x26000000);
}
''';
  _writeFile('lib/src/core/design_system/theme/colors.dart', colorsContent);

  // Generate Typography
  final typographyContent = '''import 'package:flutter/material.dart';
import 'colors.dart';

/// Application text styles
class AppTextStyles {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.25,
  );
  
  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.29,
  );
  
  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.33,
  );
  
  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.44,
  );
  
  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.43,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.33,
  );
  
  // Labels
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.43,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.33,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.45,
  );
  
  // Button text
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
  );
  
  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
  );
}
''';
  _writeFile(
    'lib/src/core/design_system/theme/typography.dart',
    typographyContent,
  );

  // Generate Theme
  final themeContent = '''import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

/// Application theme configuration
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        displaySmall: AppTextStyles.h3,
        headlineLarge: AppTextStyles.h4,
        headlineMedium: AppTextStyles.h5,
        headlineSmall: AppTextStyles.h6,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      cardTheme: CardTheme(
        color: AppColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
    );
  }
}
''';
  _writeFile('lib/src/core/design_system/theme/theme.dart', themeContent);

  // Generate button components
  final buttonsContent = '''import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

/// Primary action button
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool fullWidth;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(AppColors.white),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 16),
                  const SizedBox(width: 8),
                ],
                Text(text, style: AppTextStyles.button),
              ],
            ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

/// Secondary action button
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool fullWidth;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16),
            const SizedBox(width: 8),
          ],
          Text(text, style: AppTextStyles.button),
        ],
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
''';
  _writeFile(
    'lib/src/core/design_system/components/buttons.dart',
    buttonsContent,
  );

  // Generate input components
  final inputsContent = '''import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

/// Custom text field
class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      style: AppTextStyles.bodyMedium,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.textSecondary) : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: AppColors.textSecondary),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
''';
  _writeFile(
    'lib/src/core/design_system/components/inputs.dart',
    inputsContent,
  );

  // Generate card components
  final cardsContent = '''import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

/// Basic card component
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
''';
  _writeFile('lib/src/core/design_system/components/cards.dart', cardsContent);

  // Update design system exports
  final designSystemContent = '''// Design System Exports
export 'theme/colors.dart';
export 'theme/typography.dart';
export 'theme/theme.dart';
export 'components/buttons.dart';
export 'components/inputs.dart';
export 'components/cards.dart';
''';
  _writeFile(
    'lib/src/core/design_system/design_system.dart',
    designSystemContent,
  );

  stdout.writeln('  ✅ Design System (Colors, Typography, Theme)');
}

void _generateNetworkLayer() {
  // Override the existing API client with updated version
  final apiClientContent = '''import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';
import '../../data/models/api_response.dart';

/// HTTP client for API requests
class ApiClient {
  late final Dio _dio;
  
  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(milliseconds: AppConfig.apiTimeout),
      receiveTimeout: const Duration(milliseconds: AppConfig.apiTimeout),
      headers: AppConfig.defaultHeaders,
    ));
    
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }
  
  /// GET request
  Future<ApiResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: \$e');
    }
  }
  
  /// POST request
  Future<ApiResponse<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: \$e');
    }
  }
  
  /// PUT request
  Future<ApiResponse<T>> put<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: \$e');
    }
  }
  
  /// DELETE request
  Future<ApiResponse<T>> delete<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: \$e');
    }
  }
  
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Unknown server error';
        return 'Server error (\$statusCode): \$message';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return 'No internet connection';
        }
        return 'Network error occurred';
      default:
        return 'An unexpected error occurred';
    }
  }
}
''';
  _writeFile('lib/src/core/network/api_client.dart', apiClientContent);

  // Generate API Response model
  final apiResponseContent = '''/// Generic API response wrapper
class ApiResponse<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;
  
  const ApiResponse._({
    this.data,
    this.errorMessage,
    required this.isSuccess,
  });
  
  /// Create successful response
  factory ApiResponse.success(T data) {
    return ApiResponse._(data: data, isSuccess: true);
  }
  
  /// Create error response
  factory ApiResponse.error(String message) {
    return ApiResponse._(errorMessage: message, isSuccess: false);
  }
  
  /// Check if response has data
  bool get hasData => data != null;
  
  /// Check if response has error
  bool get hasError => errorMessage != null;
  
  /// Create copy with different values
  ApiResponse<T> copyWith({
    T? data,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ApiResponse._(
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
  
  @override
  String toString() {
    if (isSuccess) {
      return 'ApiResponse.success(data: \$data)';
    } else {
      return 'ApiResponse.error(message: \$errorMessage)';
    }
  }
}
''';
  _writeFile('lib/src/data/models/api_response.dart', apiResponseContent);

  stdout.writeln('  ✅ Network Layer (API Client, Response Model)');
}

void _generateUtilities() {
  // String utilities
  final stringUtilsContent = '''/// String manipulation utilities
class StringUtils {
  /// Capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  /// Convert to camelCase
  static String toCamelCase(String text) {
    final words = text.split(RegExp(r'[\\s_-]+'));
    if (words.isEmpty) return '';
    
    final first = words.first.toLowerCase();
    final rest = words.skip(1).map((word) => capitalize(word));
    return first + rest.join();
  }
  
  /// Convert to snake_case
  static String toSnakeCase(String text) {
    return text
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_\${match.group(0)}')
        .toLowerCase()
        .replaceAll(RegExp(r'^_'), '');
  }
  
  /// Truncate text with ellipsis
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - suffix.length) + suffix;
  }
  
  /// Check if string is valid email
  static bool isEmail(String email) {
    return RegExp(r'^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$').hasMatch(email);
  }
  
  /// Check if string is valid phone number
  static bool isPhoneNumber(String phone) {
    return RegExp(r'^[\\+]?[1-9]?[0-9]{7,15}\$').hasMatch(phone);
  }
  
  /// Check if string is valid URL
  static bool isUrl(String url) {
    return RegExp(r'^https?:\\/\\/.+').hasMatch(url);
  }
  
  /// Remove HTML tags
  static String removeHtmlTags(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
  
  /// Generate random string
  static String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(length, (index) => chars[(DateTime.now().millisecondsSinceEpoch + index) % chars.length]).join();
  }
}
''';
  _writeFile('lib/src/core/utils/string_utils.dart', stringUtilsContent);

  // Date utilities
  final dateUtilsContent = '''/// Date and time utilities
class AppDateUtils {
  /// Format date to readable string
  static String formatDate(DateTime date, {String format = 'MMM dd, yyyy'}) {
    // Simple date formatting - in production, use intl package
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '\${months[date.month - 1]} \${date.day.toString().padLeft(2, '0')}, \${date.year}';
  }
  
  /// Format time to readable string
  static String formatTime(DateTime date) {
    final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '\${hour == 0 ? 12 : hour}:\${date.minute.toString().padLeft(2, '0')} \$period';
  }
  
  /// Get relative time (e.g., "2 hours ago")
  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 7) {
      return formatDate(date);
    } else if (difference.inDays > 0) {
      return '\${difference.inDays} day\${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '\${difference.inHours} hour\${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '\${difference.inMinutes} minute\${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
  
  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }
  
  /// Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day;
  }
  
  /// Format duration to readable string
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    
    if (hours > 0) {
      return '\${hours}h \${minutes}m';
    } else {
      return '\${minutes}m';
    }
  }
  
  /// Get start of day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  
  /// Get end of day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }
}
''';
  _writeFile('lib/src/core/utils/date_utils.dart', dateUtilsContent);

  // Validators
  final validatorsContent = '''/// Form validation utilities
class Validators {
  /// Validate email
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
  
  /// Validate password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)').hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, and number';
    }
    return null;
  }
  
  /// Validate phone number
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^[\\+]?[1-9]?[0-9]{7,15}\$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
  
  /// Validate required field
  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '\$fieldName is required';
    }
    return null;
  }
  
  /// Validate minimum length
  static String? minLength(String? value, int minLength, {String fieldName = 'This field'}) {
    if (value == null || value.length < minLength) {
      return '\$fieldName must be at least \$minLength characters';
    }
    return null;
  }
  
  /// Validate maximum length
  static String? maxLength(String? value, int maxLength, {String fieldName = 'This field'}) {
    if (value != null && value.length > maxLength) {
      return '\$fieldName must not exceed \$maxLength characters';
    }
    return null;
  }
  
  /// Validate URL
  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    if (!RegExp(r'^https?:\\/\\/.+').hasMatch(value)) {
      return 'Enter a valid URL';
    }
    return null;
  }
  
  /// Validate numeric value
  static String? numeric(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '\$fieldName is required';
    }
    if (double.tryParse(value) == null) {
      return '\$fieldName must be a number';
    }
    return null;
  }
}
''';
  _writeFile('lib/src/core/utils/validators.dart', validatorsContent);

  // Utils export file
  final utilsContent = '''// Utility Exports
export 'string_utils.dart';
export 'date_utils.dart';
export 'validators.dart';
export 'navigation_utils.dart';
export 'logger.dart';
export 'device_utils.dart';
''';
  _writeFile('lib/src/core/utils/utils.dart', utilsContent);

  // Navigation utilities
  final navigationUtilsContent = '''import 'package:flutter/material.dart';

/// Navigation utilities for common navigation tasks
class NavigationUtils {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  /// Get current context
  static BuildContext? get currentContext => navigatorKey.currentContext;
  
  /// Get current navigator state
  static NavigatorState? get navigator => navigatorKey.currentState;
  
  /// Push new route
  static Future<T?> push<T extends Object?>(Widget page) {
    return navigator?.push<T>(
      MaterialPageRoute(builder: (_) => page),
    ) ?? Future.value(null);
  }
  
  /// Push named route
  static Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return navigator?.pushNamed<T>(routeName, arguments: arguments) ?? Future.value(null);
  }
  
  /// Replace current route
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page, {TO? result}) {
    return navigator?.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
      result: result,
    ) ?? Future.value(null);
  }
  
  /// Push and clear stack
  static Future<T?> pushAndClearStack<T extends Object?>(Widget page) {
    return navigator?.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    ) ?? Future.value(null);
  }
  
  /// Pop current route
  static void pop<T extends Object?>([T? result]) {
    if (navigator?.canPop() == true) {
      navigator?.pop<T>(result);
    }
  }
  
  /// Pop until route
  static void popUntil(String routeName) {
    navigator?.popUntil(ModalRoute.withName(routeName));
  }
  
  /// Show snack bar
  static void showSnackBar({
    required String message,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          action: action,
          duration: duration,
        ),
      );
    }
  }
  
  /// Show dialog
  static Future<T?> showAlertDialog<T>({
    required String title,
    required String content,
    String confirmText = 'OK',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final context = currentContext;
    if (context == null) return Future.value(null);
    
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
  
  /// Show loading dialog
  static void showLoadingDialog({String message = 'Loading...'}) {
    final context = currentContext;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 16),
              Text(message),
            ],
          ),
        ),
      );
    }
  }
  
  /// Hide loading dialog
  static void hideLoadingDialog() {
    final context = currentContext;
    if (context != null && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
''';
  _writeFile(
    'lib/src/core/utils/navigation_utils.dart',
    navigationUtilsContent,
  );

  // Logger utilities
  final loggerContent = '''import 'package:flutter/foundation.dart';

/// Logging utilities for development and debugging
class AppLogger {
  static const String _prefix = '[StarterKit]';
  
  /// Log debug message
  static void d(String message, [String? tag]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '\$_prefix [\$tag] \$message' : '\$_prefix \$message';
      debugPrint(logMessage);
    }
  }
  
  /// Log info message  
  static void i(String message, [String? tag]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '\$_prefix [INFO] [\$tag] \$message' : '\$_prefix [INFO] \$message';
      debugPrint(logMessage);
    }
  }
  
  /// Log warning message
  static void w(String message, [String? tag]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '\$_prefix [WARNING] [\$tag] \$message' : '\$_prefix [WARNING] \$message';
      debugPrint(logMessage);
    }
  }
  
  /// Log error message
  static void e(String message, [String? tag, Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '\$_prefix [ERROR] [\$tag] \$message' : '\$_prefix [ERROR] \$message';
      debugPrint(logMessage);
      
      if (error != null) {
        debugPrint('\$_prefix [ERROR] Exception: \$error');
      }
      
      if (stackTrace != null) {
        debugPrint('\$_prefix [ERROR] Stack trace: \$stackTrace');
      }
    }
  }
  
  /// Log network request
  static void network(String method, String url, {Map<String, dynamic>? data}) {
    if (kDebugMode) {
      debugPrint('\$_prefix [NETWORK] \$method \$url');
      if (data != null) {
        debugPrint('\$_prefix [NETWORK] Data: \$data');
      }
    }
  }
  
  /// Log performance timing
  static void performance(String operation, Duration duration) {
    if (kDebugMode) {
      debugPrint('\$_prefix [PERFORMANCE] \$operation took \${duration.inMilliseconds}ms');
    }
  }
  
  /// Trace method execution
  static void trace(String methodName, [String? className]) {
    if (kDebugMode) {
      final message = className != null ? '\$className.\$methodName' : methodName;
      debugPrint('\$_prefix [TRACE] \$message');
    }
  }
}
''';
  _writeFile('lib/src/core/utils/logger.dart', loggerContent);

  // Device utilities
  final deviceUtilsContent = '''import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Device information and platform utilities
class DeviceUtils {
  /// Get device unique identifier
  static Future<String> getDeviceId() async {
    if (kIsWeb) {
      return 'web-device';
    }
    
    try {
      // In a real app, you'd use device_info_plus package
      if (Platform.isIOS) {
        return 'ios-device-\${DateTime.now().millisecondsSinceEpoch}';
      } else if (Platform.isAndroid) {
        return 'android-device-\${DateTime.now().millisecondsSinceEpoch}';
      } else {
        return 'unknown-device-\${DateTime.now().millisecondsSinceEpoch}';
      }
    } catch (e) {
      return 'unknown-device';
    }
  }
  
  /// Get device name
  static Future<String> getDeviceName() async {
    if (kIsWeb) {
      return 'Web Browser';
    }
    
    try {
      if (Platform.isIOS) {
        return 'iPhone';
      } else if (Platform.isAndroid) {
        return 'Android Device';
      } else if (Platform.isMacOS) {
        return 'Mac';
      } else if (Platform.isWindows) {
        return 'Windows PC';
      } else if (Platform.isLinux) {
        return 'Linux PC';
      } else {
        return 'Unknown Device';
      }
    } catch (e) {
      return 'Unknown Device';
    }
  }
  
  /// Get OS version
  static Future<String> getOsVersion() async {
    if (kIsWeb) {
      return 'Web';
    }
    
    try {
      return Platform.operatingSystemVersion;
    } catch (e) {
      return 'Unknown';
    }
  }
  
  /// Get app version
  static Future<String> getAppVersion() async {
    try {
      // In a real app, you'd use package_info_plus
      return '1.0.0';
    } catch (e) {
      return 'Unknown';
    }
  }
  
  /// Get package name
  static Future<String> getPackageName() async {
    try {
      // In a real app, you'd use package_info_plus
      return 'com.example.app';
    } catch (e) {
      return 'Unknown';
    }
  }
  
  /// Get device type
  static Future<String> getDeviceType() async {
    if (kIsWeb) {
      return 'web';
    }
    
    try {
      if (Platform.isIOS || Platform.isAndroid) {
        return 'mobile';
      } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
        return 'desktop';
      } else {
        return 'unknown';
      }
    } catch (e) {
      return 'unknown';
    }
  }
  
  /// Check if device is mobile
  static bool isMobile() {
    if (kIsWeb) return false;
    return Platform.isIOS || Platform.isAndroid;
  }
  
  /// Check if device is desktop
  static bool isDesktop() {
    if (kIsWeb) return false;
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }
  
  /// Check if running on web
  static bool isWeb() {
    return kIsWeb;
  }
  
  /// Check if device is iOS
  static bool isIOS() {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }
  
  /// Check if device is Android
  static bool isAndroid() {
    if (kIsWeb) return false;
    return Platform.isAndroid;
  }
  
  /// Vibrate device (if supported)
  static Future<void> vibrate() async {
    try {
      await HapticFeedback.mediumImpact();
    } catch (e) {
      // Vibration not supported
    }
  }
  
  /// Hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
  
  /// Check if keyboard is visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
  
  /// Get screen size
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  
  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = (size.width * size.width + size.height * size.height);
    return diagonal > 1100000; // Rough tablet detection
  }
}
''';
  _writeFile('lib/src/core/utils/device_utils.dart', deviceUtilsContent);

  stdout.writeln('  ✅ Utilities (String, Date, Validators)');
}

void _generateDependencyInjection() {
  final diContent = '''import 'package:get_it/get_it.dart';
import '../config/app_config.dart';
import '../network/api_client.dart';

/// Dependency injection container
final GetIt getIt = GetIt.instance;

/// Shorthand for getting dependencies
T get<T extends Object>() => getIt<T>();

/// Configure dependencies for different environments
Future<void> configureDependencies({String environment = 'production'}) async {
  // Register core services
  getIt.registerLazySingleton<AppConfig>(() => AppConfig());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  
  // Environment-specific configurations
  switch (environment) {
    case 'development':
    case 'dev':
      await _configureDevelopmentDependencies();
      break;
    case 'staging':
      await _configureStagingDependencies();
      break;
    case 'production':
    default:
      await _configureProductionDependencies();
      break;
  }
}

Future<void> _configureDevelopmentDependencies() async {
  // Development-specific services
  // Example: Mock services, debug tools
}

Future<void> _configureStagingDependencies() async {
  // Staging-specific services
  // Example: Analytics, crash reporting
}

Future<void> _configureProductionDependencies() async {
  // Production-specific services
  // Example: Analytics, crash reporting, performance monitoring
}

/// Reset dependencies (useful for testing)
void resetDependencies() {
  getIt.reset();
}
''';
  _writeFile('lib/src/core/di/di.dart', diContent);
  stdout.writeln('  ✅ Dependency Injection');
}

void _generateLocalization() {
  final localizationContent = '''import 'package:flutter/material.dart';

/// Basic localization support
class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);
  
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  
  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('es', ''),
    Locale('fr', ''),
  ];
  
  // Common strings
  String get appName => _get('appName');
  String get loading => _get('loading');
  String get error => _get('error');
  String get success => _get('success');
  String get cancel => _get('cancel');
  String get ok => _get('ok');
  String get save => _get('save');
  String get delete => _get('delete');
  String get edit => _get('edit');
  
  String _get(String key) {
    final strings = _localizedValues[locale.languageCode] ?? _localizedValues['en']!;
    return strings[key] ?? key;
  }
  
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'My App',
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'cancel': 'Cancel',
      'ok': 'OK',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
    },
    'es': {
      'appName': 'Mi Aplicación',
      'loading': 'Cargando...',
      'error': 'Error',
      'success': 'Éxito',
      'cancel': 'Cancelar',
      'ok': 'OK',
      'save': 'Guardar',
      'delete': 'Eliminar',
      'edit': 'Editar',
    },
  };
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any((l) => l.languageCode == locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }
  
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
''';
  _writeFile(
    'lib/src/core/localization/app_localizations.dart',
    localizationContent,
  );
  stdout.writeln('  ✅ Localization Support');
}

void _generateMainExports() {
  final exportsContent = '''// StarterKit - Flutter Boilerplate Generator
//
// Complete boilerplate with clean architecture, design system,
// and essential utilities for rapid Flutter development.

// Core exports
export 'src/core/config/app_config.dart';
export 'src/core/design_system/design_system.dart';
export 'src/core/di/di.dart';
export 'src/core/localization/app_localizations.dart';
export 'src/core/network/api_client.dart';
export 'src/core/utils/utils.dart';

// Data layer exports
export 'src/data/models/api_response.dart';

// Domain layer exports (add as needed)
''';
  _writeFile('lib/starter_kit.dart', exportsContent);
  stdout.writeln('  ✅ Main Exports Updated');
}

// Template generation methods (simplified versions)
String _generateScreenTemplate(String screenName) {
  // Remove "Screen" from the end if it exists to avoid duplication
  final cleanScreenName =
      screenName.endsWith('Screen')
          ? screenName.substring(0, screenName.length - 6)
          : screenName;

  return '''import 'package:flutter/material.dart';
import 'package:starter_kit/starter_kit.dart';

class ${cleanScreenName}Screen extends StatefulWidget {
  const ${cleanScreenName}Screen({super.key});

  @override
  State<${cleanScreenName}Screen> createState() => _${cleanScreenName}ScreenState();
}

class _${cleanScreenName}ScreenState extends State<${cleanScreenName}Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$cleanScreenName')),
      body: Center(
        child: Text('$cleanScreenName Screen'),
      ),
    );
  }
}
''';
}

String _generateScreenTestTemplate(String screenName, String fileName) {
  // Remove "Screen" from the end if it exists to avoid duplication
  final cleanScreenName =
      screenName.endsWith('Screen')
          ? screenName.substring(0, screenName.length - 6)
          : screenName;

  return '''import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/src/presentation/pages/${fileName}_screen.dart';

void main() {
  group('${cleanScreenName}Screen Tests', () {
    testWidgets('should display screen', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: ${cleanScreenName}Screen()),
      );
      
      expect(find.text('$cleanScreenName Screen'), findsOneWidget);
    });
  });
}
''';
}

String _generateRepositoryTemplate(String serviceName, String fileName) {
  return '''import 'package:starter_kit/starter_kit.dart';
import '../../domain/repositories/${fileName}_repository.dart';

class ${serviceName}RepositoryImpl implements I${serviceName}Repository {
  final ApiClient _apiClient;
  
  ${serviceName}RepositoryImpl(this._apiClient);
  
  @override
  Future<ApiResponse<List<Map<String, dynamic>>>> getAll() async {
    return await _apiClient.get('/${fileName}s');
  }
  
  @override
  Future<ApiResponse<Map<String, dynamic>>> getById(String id) async {
    return await _apiClient.get('/${fileName}s/\$id');
  }
  
  @override
  Future<ApiResponse<Map<String, dynamic>>> create(Map<String, dynamic> data) async {
    return await _apiClient.post('/${fileName}s', data: data);
  }
  
  @override
  Future<ApiResponse<Map<String, dynamic>>> update(String id, Map<String, dynamic> data) async {
    return await _apiClient.put('/${fileName}s/\$id', data: data);
  }
  
  @override
  Future<ApiResponse<void>> delete(String id) async {
    return await _apiClient.delete('/${fileName}s/\$id');
  }
}
''';
}

String _generateRepositoryInterfaceTemplate(
  String serviceName,
  String fileName,
) {
  return '''import 'package:starter_kit/starter_kit.dart';

abstract class I${serviceName}Repository {
  Future<ApiResponse<List<Map<String, dynamic>>>> getAll();
  Future<ApiResponse<Map<String, dynamic>>> getById(String id);
  Future<ApiResponse<Map<String, dynamic>>> create(Map<String, dynamic> data);
  Future<ApiResponse<Map<String, dynamic>>> update(String id, Map<String, dynamic> data);
  Future<ApiResponse<void>> delete(String id);
}
''';
}

String _generateApiTestTemplate(String serviceName, String fileName) {
  return '''import 'package:flutter_test/flutter_test.dart';

void main() {
  group('${serviceName}Repository Tests', () {
    test('should perform CRUD operations', () {
      // TODO: Implement tests with mocks
      expect(true, true);
    });
  });
}
''';
}

String _generateModelTemplate(String modelName) {
  return '''import 'package:equatable/equatable.dart';

class $modelName extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const $modelName({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory $modelName.fromJson(Map<String, dynamic> json) {
    return $modelName(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  $modelName copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return $modelName(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
''';
}

String _generateEntityTemplate(String modelName) {
  return '''import 'package:equatable/equatable.dart';

class ${modelName}Entity extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ${modelName}Entity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
''';
}

String _generateModelTestTemplate(String modelName, String fileName) {
  return '''import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/src/data/models/$fileName.dart';

void main() {
  group('$modelName Tests', () {
    test('should create from JSON', () {
      final json = {
        'id': '1',
        'name': 'Test',
        'createdAt': '2024-01-01T00:00:00Z',
        'updatedAt': '2024-01-01T00:00:00Z',
      };

      final model = $modelName.fromJson(json);

      expect(model.id, '1');
      expect(model.name, 'Test');
    });

    test('should convert to JSON', () {
      final model = $modelName(
        id: '1',
        name: 'Test',
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final json = model.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'Test');
    });
  });
}
''';
}

// Utility functions
void _writeFile(String path, String content) {
  final file = File(path);
  file.createSync(recursive: true);
  file.writeAsStringSync(content);
}
