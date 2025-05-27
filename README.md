# StarterKit - Flutter Boilerplate Generator

[![pub package](https://img.shields.io/pub/v/starter_kit.svg)](https://pub.dev/packages/starter_kit)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Stop writing boilerplate. Start building features.**

A comprehensive Flutter package that generates production-ready boilerplate with clean architecture, beautiful design system, and essential utilities in seconds.

---

## ⚡ Quick Start

```bash
flutter pub add starter_kit              # Add package
dart run starter_kit init                # Generate boilerplate
dart run starter_kit add_screen Login    # Create screens
dart run starter_kit add_api UserAPI     # Add API services
```

**🎯 What you get:** Complete project structure, design system, network layer, utilities, and tests - all in under 30 seconds!

---

## 📚 Table of Contents

### 🏁 Getting Started
- [What is StarterKit?](#-what-is-starterkit)
- [Why Choose StarterKit?](#-why-choose-starterkit)
- [Installation](#-installation)
- [First Steps](#-first-steps)

### 🛠️ Core Features
- [CLI Commands](#️-cli-commands)
- [Project Architecture](#-project-architecture)
- [Generated Structure](#-generated-structure)

### 🎨 Design & Development
- [Design System](#-design-system)
- [Network & APIs](#-network--apis)
- [Utilities & Helpers](#-utilities--helpers)

### 📖 Guides & Examples
- [Complete Examples](#-complete-examples)
- [Best Practices](#-best-practices)
- [Configuration](#-configuration)

### 🔧 Advanced
- [Testing Strategy](#-testing-strategy)
- [Customization](#-customization)
- [Contributing](#-contributing)

---

## 🌟 What is StarterKit?

StarterKit eliminates the **tedious setup phase** of Flutter projects. Instead of spending hours setting up folder structures, design systems, and boilerplate code, you get everything instantly.

### 📊 Traditional vs StarterKit Approach

| Traditional Setup | ⏱️ Time | StarterKit | ⏱️ Time |
|------------------|----------|------------|----------|
| Create folder structure | 30 min | `dart run starter_kit init` | 10 sec |
| Setup clean architecture | 2 hours | ✅ Auto-generated | 0 sec |
| Design color system | 1 hour | ✅ WeChat-inspired included | 0 sec |
| Create API client | 1 hour | ✅ Production-ready client | 0 sec |
| Write form validators | 45 min | ✅ Pre-built validators | 0 sec |
| Setup testing structure | 1 hour | ✅ Complete test framework | 0 sec |
| **Total Setup Time** | **~6 hours** | **Total Setup Time** | **~10 seconds** |

---

## 💡 Why Choose StarterKit?

### 🎯 Core Benefits

```
┌─ SPEED ────────────────────────────────────────────────┐
│  • 25+ files generated in 10 seconds                  │
│  • Skip repetitive boilerplate setup                  │
│  • Focus on building features, not infrastructure     │
└────────────────────────────────────────────────────────┘

┌─ QUALITY ──────────────────────────────────────────────┐
│  • Industry-standard clean architecture               │
│  • Production-ready error handling                    │
│  • Comprehensive testing structure                    │
└────────────────────────────────────────────────────────┘

┌─ CONSISTENCY ──────────────────────────────────────────┐
│  • Standardized project structure                     │
│  • Unified coding patterns                            │
│  • Team-friendly conventions                          │
└────────────────────────────────────────────────────────┘
```

### 🏆 What Makes It Special

- **🚀 Zero Configuration** - Works out of the box
- **📱 Mobile-First** - Optimized for Flutter development
- **🎨 Beautiful Design** - WeChat-inspired design system
- **🧪 Test-Ready** - Complete testing infrastructure
- **📈 Scalable** - Grows with your project needs

---

## 📦 Installation

### Step 1: Add Dependency

Add to your `pubspec.yaml`:

```yaml
dependencies:
  starter_kit: ^1.0.1

dev_dependencies:
  flutter_test:
    sdk: flutter
```

### Step 2: Install Package

```bash
flutter pub get
```

### Step 3: Verify Installation

```bash
dart run starter_kit --help
```

---

## 🏁 First Steps

### 🎬 Initialize Your Project

```bash
dart run starter_kit init
```

**✨ This single command creates:**

```
📦 Your Flutter Project
├── 🏗️  Clean Architecture Setup
├── 🎨  Complete Design System
├── 🌐  Production API Client
├── 🛠️  Utility Functions
├── 🧪  Testing Infrastructure
└── 📱  Ready-to-use Components
```

### 🎯 What Gets Generated

| Component | Files Created | Purpose |
|-----------|---------------|---------|
| **🏗️ Architecture** | 8 files | Domain, Data, Presentation layers |
| **🎨 Design System** | 6 files | Colors, typography, components |
| **🌐 Network Layer** | 3 files | API client, error handling |
| **🛠️ Utilities** | 5 files | Validators, helpers, navigation |
| **🧪 Testing** | 3 files | Unit, widget, integration tests |

---

## 🛠️ CLI Commands

StarterKit provides 4 powerful commands to accelerate your development:

### 📋 Command Overview

```
┌─ COMMAND ──────────┬─ PURPOSE ──────────────┬─ FILES ─┬─ TIME ─┐
│ init               │ Complete setup         │   25+   │  10s   │
├────────────────────┼────────────────────────┼─────────┼────────┤
│ add_screen <name>  │ Create new screen      │    2    │   2s   │
├────────────────────┼────────────────────────┼─────────┼────────┤
│ add_api <name>     │ Generate API service   │    3    │   3s   │
├────────────────────┼────────────────────────┼─────────┼────────┤
│ add_model <name>   │ Create data model      │    3    │   2s   │
└────────────────────┴────────────────────────┴─────────┴────────┘
```

### 🎯 Real-World Usage Examples

**🔐 Building Authentication Flow**
```bash
dart run starter_kit add_screen LoginScreen
dart run starter_kit add_screen SignupScreen  
dart run starter_kit add_api AuthService
dart run starter_kit add_model User
```

**🛒 Creating E-commerce Features**
```bash
dart run starter_kit add_screen ProductListScreen
dart run starter_kit add_screen ProductDetailScreen
dart run starter_kit add_api ProductService
dart run starter_kit add_model Product
```

### 📊 Command Details

#### `init` - Project Foundation
- ✅ Creates complete folder structure
- ✅ Sets up clean architecture
- ✅ Generates design system
- ✅ Configures API client
- ✅ Implements utilities

#### `add_screen` - UI Creation
- ✅ Generates StatefulWidget
- ✅ Includes proper imports
- ✅ Creates widget test file
- ✅ Follows naming conventions

#### `add_api` - Service Generation
- ✅ Creates repository interface
- ✅ Implements repository pattern
- ✅ Generates unit tests
- ✅ Includes error handling

#### `add_model` - Data Structures
- ✅ Creates domain entity
- ✅ Generates data model
- ✅ Implements JSON serialization
- ✅ Includes unit tests

---

## 🏗️ Project Architecture

StarterKit implements **Clean Architecture** with clear separation of concerns:

### 📊 Architecture Layers

```
┌─────────────────────────────────────────────────────────┐
│                 🎨 PRESENTATION LAYER                   │
│                                                         │
│  Screen Widgets → State Management → User Interactions │
└─────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────┐
│                   🧠 DOMAIN LAYER                       │
│                                                         │
│   Business Logic → Entities → Repository Contracts     │
└─────────────────────────────────────────────────────────┘
                              ↓  
┌─────────────────────────────────────────────────────────┐
│                    💾 DATA LAYER                        │
│                                                         │
│    API Calls → Data Models → Repository Implementation │
└─────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────┐
│                    ⚙️ CORE LAYER                        │
│                                                         │
│     Utilities → Configuration → Dependency Injection   │
└─────────────────────────────────────────────────────────┘
```

### 🎯 Layer Responsibilities

| Layer | 🎯 Focus | 📋 Responsibilities | 🔗 Dependencies |
|-------|----------|-------------------|----------------|
| **🎨 Presentation** | UI & UX | Widgets, screens, user interactions | Domain + Core |
| **🧠 Domain** | Business Logic | Entities, use cases, business rules | Core only |
| **💾 Data** | Data Access | API calls, caching, data transformation | Domain + Core |
| **⚙️ Core** | Infrastructure | Configuration, utilities, DI container | External packages |

### 📈 Benefits of This Architecture

```
┌─ MAINTAINABILITY ──────────────────────────────────────┐
│  ✅ Clear separation of concerns                      │
│  ✅ Easy to locate and modify code                    │
│  ✅ Reduced coupling between layers                   │
└────────────────────────────────────────────────────────┘

┌─ TESTABILITY ──────────────────────────────────────────┐
│  ✅ Each layer can be tested independently           │
│  ✅ Easy mocking of dependencies                      │
│  ✅ Clear test boundaries                             │
└────────────────────────────────────────────────────────┘

┌─ SCALABILITY ──────────────────────────────────────────┐
│  ✅ Easy to add new features                          │
│  ✅ Supports team collaboration                       │
│  ✅ Framework-independent business logic              │
└────────────────────────────────────────────────────────┘
```

---

## 📁 Generated Structure

After running `dart run starter_kit init`:

```
📦 your_project/
├── 📁 lib/
│   ├── 📄 starter_kit.dart                    # 🚀 Main exports
│   └── 📁 src/
│       ├── 📁 core/                          # ⚙️ Core functionality
│       │   ├── 📁 config/                    # ⚙️ App configuration
│       │   ├── 📁 design_system/             # 🎨 UI components & theme
│       │   ├── 📁 di/                        # 🔧 Dependency injection
│       │   ├── 📁 network/                   # 🌐 HTTP client
│       │   └── 📁 utils/                     # 🛠️ Helper functions
│       ├── 📁 data/                          # 💾 Data layer
│       │   ├── 📁 models/                    # 📊 Data models
│       │   └── 📁 repositories/              # 🏪 Data repositories
│       ├── 📁 domain/                        # 🧠 Business logic
│       │   ├── 📁 entities/                  # 📋 Domain entities
│       │   └── 📁 repositories/              # 📄 Repository contracts
│       └── 📁 presentation/                  # 🎨 UI layer
│           ├── 📁 pages/                     # 📱 Screen widgets
│           └── 📁 widgets/                   # 🧩 Reusable components
├── 📁 test/                                  # 🧪 Testing
│   ├── 📁 unit/                             # 🔬 Unit tests
│   ├── 📁 widget/                           # 🎭 Widget tests
│   └── 📁 integration/                      # 🔗 Integration tests
└── 📁 assets/                               # 🎭 Resources
    ├── 📁 images/                           # 🖼️ Images
    ├── 📁 icons/                            # 🎯 Icons
    └── 📁 fonts/                            # 📝 Custom fonts
```

---

## 🎨 Design System

StarterKit includes a **WeChat-inspired design system** for consistent, beautiful UIs.

### 🎨 Color Palette

**Primary Colors - Main Actions**
- `AppColors.primary` - #07C160 (WeChat Green)
- `AppColors.primaryDark` - #05A050 (Hover states)
- `AppColors.primaryLight` - #4CD98B (Backgrounds)

**Text Hierarchy**
- `AppColors.textPrimary` - #1A1A1A (Headings)
- `AppColors.textSecondary` - #8C8C8C (Body text)
- `AppColors.textTertiary` - #BFBFBF (Captions)

**Status Colors**
- `AppColors.success` - #52C41A (Success states)
- `AppColors.warning` - #FAAD14 (Warning states)
- `AppColors.error` - #F5222D (Error states)
- `AppColors.info` - #1890FF (Info states)

### 📝 Typography Scale

| Style | Size | Weight | Usage Example |
|-------|------|--------|---------------|
| **h1** | 32px | Bold | Page titles, hero text |
| **h2** | 28px | Bold | Section headers |
| **h3** | 24px | SemiBold | Subsection titles |
| **h4** | 20px | SemiBold | Card titles, form labels |
| **bodyLarge** | 16px | Regular | Main content, descriptions |
| **bodyMedium** | 14px | Regular | Secondary content |
| **bodySmall** | 12px | Regular | Supporting text, footnotes |
| **button** | 14px | Medium | Button labels |
| **caption** | 10px | Regular | Timestamps, metadata |

### 🧩 Ready-to-Use Components

**🔘 Buttons**
- `PrimaryButton` - Main actions (save, submit, continue)
- `SecondaryButton` - Secondary actions (cancel, back)

**📝 Input Fields**  
- `AppTextField` - Text inputs with validation
- `AppDropdown` - Selection dropdowns
- `AppDatePicker` - Date/time selection

**🃏 Layout Components**
- `AppCard` - Content containers
- `AppScaffold` - Page structure
- `AppAppBar` - Navigation bars

---

## 🌐 Network & APIs

StarterKit provides a **production-ready HTTP client** built on Dio.

### 🔄 API Response Flow

```
📱 Your App Request
         ↓
🛡️ API Client (StarterKit)
         ↓
🌐 HTTP Request (Dio)
         ↓
🏪 External API
         ↓
📦 Raw Response
         ↓
✨ Processed Response (StarterKit)
         ↓
📱 Your App (Success/Error)
```

### 📊 Error Handling Matrix

| Scenario | HTTP Code | StarterKit Response | User Experience |
|----------|-----------|-------------------|----------------|
| **No Internet** | - | "Connection failed" | Retry prompt |
| **Request Timeout** | - | "Request timed out" | Retry option |
| **Unauthorized** | 401 | "Login required" | Redirect to login |
| **Forbidden** | 403 | "Access denied" | Contact support |
| **Not Found** | 404 | "Resource not found" | Navigate back |
| **Server Error** | 500+ | "Server unavailable" | Try again later |

### 🔧 Response Wrapper

All API responses use a **consistent format**:

```dart
ApiResponse<T> {
  ✅ data: T?              // Success data
  ❌ errorMessage: String? // Error description
  📊 isSuccess: bool       // Status indicator
}
```

---

## 🛠️ Utilities & Helpers

StarterKit includes **battle-tested utilities** for common development tasks.

### ✅ Form Validation

**Available Validators:**
- `Validators.email` - Email format validation
- `Validators.password` - Strong password requirements
- `Validators.phone` - Phone number validation
- `Validators.required` - Required field validation
- `Validators.minLength` - Minimum character count
- `Validators.maxLength` - Maximum character count

### 🧭 Navigation Helpers

**Simple Navigation:**
- `NavigationUtils.push()` - Navigate to screen
- `NavigationUtils.pushReplacement()` - Replace current screen
- `NavigationUtils.pushAndClearStack()` - Clear navigation history

**User Feedback:**
- `NavigationUtils.showSnackBar()` - Show success/error messages
- `NavigationUtils.showAlertDialog()` - Show confirmation dialogs

### 🔤 String Utilities

**Text Manipulation:**
- `'hello world'.capitalize()` → 'Hello world'
- `'hello world'.toCamelCase()` → 'helloWorld'
- `'HelloWorld'.toSnakeCase()` → 'hello_world'
- `'Long text...'.truncate(10)` → 'Long te...'

**Validation Helpers:**
- `'email@test.com'.isEmail()` → true
- `'+1234567890'.isPhoneNumber()` → true
- `'https://example.com'.isUrl()` → true

### 📅 Date Utilities

**Formatting:**
- `DateTime.now().formatDate()` → 'Mar 15, 2024'
- `DateTime.now().formatRelativeTime()` → '2 hours ago'
- `Duration(hours: 2).formatDuration()` → '2h 0m'

---

## 📖 Complete Examples

### 🔐 Authentication Example

**Generate authentication components:**
```bash
dart run starter_kit add_screen LoginScreen
dart run starter_kit add_api AuthService  
dart run starter_kit add_model User
```

**Simple login implementation:**
```dart
// Minimal login screen example
class LoginScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          AppTextField(
            labelText: 'Email',
            validator: Validators.email,
          ),
          AppTextField(
            labelText: 'Password',
            obscureText: true,
            validator: Validators.required,
          ),
          PrimaryButton(
            text: 'Sign In',
            onPressed: () => _handleLogin(),
          ),
        ],
      ),
    );
  }
}
```

### 🛒 E-commerce Example

**Generate e-commerce components:**
```bash
dart run starter_kit add_screen ProductListScreen
dart run starter_kit add_api ProductService
dart run starter_kit add_model Product
```

---

## 🎯 Best Practices

### 📋 Project Organization

```
✅ DO: Use provided folder structure
✅ DO: Follow naming conventions
✅ DO: Keep layers separated
✅ DO: Write tests for new features

❌ DON'T: Mix presentation with business logic
❌ DON'T: Skip validation on user inputs
❌ DON'T: Ignore error handling
❌ DON'T: Hard-code configuration values
```

### 🔧 Development Workflow

1. **🏗️ Setup** - Run `dart run starter_kit init`
2. **📱 Screens** - Generate with `add_screen`
3. **🌐 APIs** - Create with `add_api`
4. **💾 Models** - Define with `add_model`
5. **🧪 Test** - Verify with `flutter test`

---

## ⚙️ Configuration

### 🌍 Environment Setup

StarterKit supports **multiple environments**:

| Environment | Purpose | Configuration |
|-------------|---------|---------------|
| **Development** | Local testing | Debug logs, mock data |
| **Staging** | QA testing | Test APIs, monitoring |
| **Production** | Live app | Optimized, analytics |

### 🔧 Build Commands

```bash
# Development
flutter run --dart-define=ENV=development

# Staging  
flutter build apk --dart-define=ENV=staging

# Production
flutter build apk --dart-define=ENV=production
```

---

## 🧪 Testing Strategy

StarterKit generates a **comprehensive testing structure**:

### 📊 Test Types

```
🔬 UNIT TESTS
├── Business logic validation
├── Utility function testing  
└── Repository method testing

🎭 WIDGET TESTS  
├── UI component behavior
├── User interaction testing
└── Widget state management

🔗 INTEGRATION TESTS
├── Complete user flows
├── API integration testing
└── End-to-end scenarios
```

### ⚡ Running Tests

```bash
flutter test                    # All tests
flutter test test/unit/         # Unit tests only
flutter test test/widget/       # Widget tests only
flutter test --coverage        # With coverage report
```

---

## 🎨 Customization

### 🎨 Theme Customization

**Override default colors:**
```dart
class MyAppColors extends AppColors {
  static const Color primary = Color(0xFF6366F1);  // Custom primary
  static const Color accent = Color(0xFF10B981);   // Custom accent
}
```

**Custom typography:**
```dart
class MyTextStyles extends AppTextStyles {
  static const TextStyle heroTitle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );
}
```

### 🔧 Component Customization

**Create custom components:**
```dart
class CustomButton extends StatelessWidget {
  // Extend StarterKit components
  // Add your custom styling
}
```

---

## 🤝 Contributing

### 🌟 How to Contribute

We welcome contributions to make StarterKit even better!

**🐛 Bug Reports**
- Report issues with clear reproduction steps
- Include Flutter/Dart version information
- Provide minimal code examples

**✨ Feature Requests**
- Suggest new CLI commands
- Propose new utility functions
- Request additional components

**📝 Documentation**
- Improve README sections
- Add code examples
- Create tutorials

### 🚀 Development Setup

```bash
# 1. Fork and clone
git clone https://github.com/your-username/starter_kit.git

# 2. Install dependencies
flutter pub get

# 3. Run tests
flutter test

# 4. Test CLI
dart run bin/starter_kit.dart init
```

### 📋 Guidelines

- ✅ Check existing issues before creating new ones
- ✅ Add tests for new features
- ✅ Update documentation for changes
- ✅ Follow existing code style
- ✅ Ensure all tests pass

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **🎨 Design Inspiration**: WeChat's clean and intuitive design language
- **🏗️ Architecture**: Clean Architecture principles by Robert C. Martin
- **❤️ Community**: Built with love for the Flutter community
- **🚀 ErrorXperts**: Created and maintained by the ErrorXperts team

---

## 🎉 Ready to Build?

```
🚀 Get Started: dart run starter_kit init
📖 Read Docs: View sections above
💬 Get Help: Open an issue on GitHub
⭐ Show Love: Star the repository
```

**Made with ❤️ by ErrorXperts**

*If StarterKit helped you build something awesome, please consider giving it a ⭐ on [GitHub](https://github.com/your-repo/starter_kit)!*
