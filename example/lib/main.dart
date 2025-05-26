import 'package:flutter/material.dart';
import 'package:starter_kit/starter_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await configureDependencies(environment: 'dev');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarterKit Example',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      navigatorKey: NavigationUtils.navigatorKey,
      home: const ExampleHomePage(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  final _emailController = TextEditingController();
  final _searchController = TextEditingController();
  String? _selectedCountry;
  bool _isLoading = false;

  final List<String> _countries = ['USA', 'Canada', 'UK', 'Germany', 'France'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StarterKit Example'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Welcome to StarterKit!',
              style: AppTextStyles.h1,
            ),
            const SizedBox(height: 8),
            Text(
              'A comprehensive Flutter boilerplate with clean architecture, beautiful UI components, and powerful utilities.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),

            // Buttons Section
            _buildSection(
              title: '🔘 Button Components',
              children: [
                AppButton(
                  text: 'Primary Button',
                  icon: Icons.rocket_launch,
                  onPressed: () => _showSnackBar('Primary button pressed!'),
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  text: 'Secondary Button',
                  icon: Icons.star,
                  onPressed: () => _showSnackBar('Secondary button pressed!'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => _showSnackBar('Outline button pressed!'),
                  icon: const Icon(Icons.favorite_border),
                  label: const Text('Outline Button'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () => _showSnackBar('Text button pressed!'),
                        icon: const Icon(Icons.link),
                        label: const Text('Text Button'),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _showSnackBar('Icon button pressed!'),
                      icon: const Icon(Icons.settings),
                    ),
                    IconButton(
                      onPressed: () => _showSnackBar('Heart button pressed!'),
                      icon: const Icon(Icons.favorite),
                      color: AppColors.error,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                AppButton(
                  text: 'Toggle Loading',
                  onPressed: () => setState(() => _isLoading = !_isLoading),
                  fullWidth: true,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Input Section
            _buildSection(
              title: '📝 Input Components',
              children: [
                AppTextField(
                  controller: _emailController,
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // Validate email as user types
                    setState(() {});
                  },
                  errorText: _emailController.text.isNotEmpty &&
                          !StringUtils.isEmail(_emailController.text)
                      ? 'Please enter a valid email address'
                      : null,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _searchController,
                  hintText: 'Search anything...',
                  prefixIcon: Icons.search,
                  onChanged: (value) => AppLogger.d('Searching: $value'),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCountry,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    hintText: 'Select your country',
                    border: OutlineInputBorder(),
                  ),
                  items: _countries
                      .map((country) => DropdownMenuItem(value: country, child: Text(country)))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedCountry = value),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Cards Section
            _buildSection(
              title: '🃏 Card Components',
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Basic Card', style: AppTextStyles.h5),
                      const SizedBox(height: 8),
                      Text(
                        'This is a basic card component with custom padding and styling.',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Text('JD', style: TextStyle(color: AppColors.white)),
                    ),
                    title: const Text('John Doe'),
                    subtitle: const Text('Software Engineer at TechCorp'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showSnackBar('Profile tapped!'),
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.info, color: AppColors.primary, size: 20),
                          const SizedBox(width: 8),
                          Text('System Information', style: AppTextStyles.h6),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('App Version', '1.0.0'),
                          _buildInfoRow('Build Number', '1'),
                          _buildInfoRow('Platform', 'Flutter'),
                          _buildInfoRow('Environment', 'Development'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.check_circle, color: AppColors.success, size: 24),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Connection Status', style: AppTextStyles.labelLarge),
                            SizedBox(height: 4),
                            Text('All systems are operational.', style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                AppCard(
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.warning,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.warning, color: AppColors.warning, size: 24),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Storage Warning', style: AppTextStyles.labelLarge),
                            SizedBox(height: 4),
                            Text('Your storage is 80% full. Consider cleaning up.',
                                style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                AppCard(
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.error, color: AppColors.error, size: 24),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sync Error', style: AppTextStyles.labelLarge),
                            SizedBox(height: 4),
                            Text('Failed to sync data. Please try again.',
                                style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Utilities Section
            _buildSection(
              title: '🛠️ Utility Functions',
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('String Utils Demo', style: AppTextStyles.h5),
                      const SizedBox(height: 12),
                      _buildUtilRow(
                          'capitalize("hello world")', StringUtils.capitalize('hello world')),
                      _buildUtilRow('truncate("Very long text...", 10)',
                          StringUtils.truncate('Very long text that needs truncation', 10)),
                      _buildUtilRow('isEmail("test@example.com")',
                          StringUtils.isEmail('test@example.com').toString()),
                      _buildUtilRow(
                          'toCamelCase("hello world")', StringUtils.toCamelCase('hello world')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date Utils Demo', style: AppTextStyles.h5),
                      const SizedBox(height: 12),
                      _buildUtilRow('formatDate(now)', AppDateUtils.formatDate(DateTime.now())),
                      _buildUtilRow(
                          'formatRelativeTime(1 hour ago)',
                          AppDateUtils.formatRelativeTime(
                              DateTime.now().subtract(const Duration(hours: 1)))),
                      _buildUtilRow(
                          'isToday(now)', AppDateUtils.isToday(DateTime.now()).toString()),
                      _buildUtilRow('formatDuration(2h 30m)',
                          AppDateUtils.formatDuration(const Duration(hours: 2, minutes: 30))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Validators Demo', style: AppTextStyles.h5),
                      const SizedBox(height: 12),
                      _buildUtilRow('email("test@example.com")',
                          Validators.email('test@example.com') ?? 'Valid ✅'),
                      _buildUtilRow(
                          'email("invalid-email")', Validators.email('invalid-email') ?? 'Valid ✅'),
                      _buildUtilRow(
                          'phone("+1234567890")', Validators.phone('+1234567890') ?? 'Valid ✅'),
                      _buildUtilRow('phone("123")', Validators.phone('123') ?? 'Valid ✅'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // API Demo Section
            _buildSection(
              title: '🌐 API Client Demo',
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('API Configuration', style: AppTextStyles.h5),
                      const SizedBox(height: 12),
                      _buildInfoRow('Base URL', AppConfig.apiBaseUrl),
                      _buildInfoRow('Environment', AppConfig.isDebug ? 'Debug' : 'Release'),
                      _buildInfoRow('App Name', AppConfig.appName),
                      _buildInfoRow('Version', AppConfig.appVersion),
                      const SizedBox(height: 16),
                      AppButton(
                        text: 'Test API Call',
                        icon: Icons.cloud_sync,
                        onPressed: _testApiCall,
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Device Info Section
            _buildSection(
              title: '📱 Device Information',
              children: [
                AppCard(
                  child: FutureBuilder<Map<String, String>>(
                    future: _getDeviceInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final deviceInfo = snapshot.data ?? {};
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Device Details', style: AppTextStyles.h5),
                          const SizedBox(height: 12),
                          ...deviceInfo.entries
                              .map((entry) => _buildInfoRow(entry.key, entry.value)),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Footer
            Center(
              child: Column(
                children: [
                  Text(
                    'Made with ❤️ using StarterKit',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () => _showSnackBar('Documentation opened!'),
                    icon: const Icon(Icons.book),
                    label: const Text('View Documentation'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h3),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilRow(String input, String output) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            input,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '→ $output',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    NavigationUtils.showSnackBar(message: message);
  }

  Future<void> _testApiCall() async {
    NavigationUtils.showLoadingDialog(message: 'Testing API...');

    try {
      final apiClient = get<ApiClient>();

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // This will fail as we don't have a real API, but it demonstrates the usage
      final response = await apiClient.get<Map<String, dynamic>>('/test');

      NavigationUtils.hideLoadingDialog();

      if (response.isSuccess) {
        _showSnackBar('API call successful!');
      } else {
        _showSnackBar('API call failed: ${response.errorMessage}');
      }
    } catch (e) {
      NavigationUtils.hideLoadingDialog();
      _showSnackBar('API call failed: $e');
    }
  }

  Future<Map<String, String>> _getDeviceInfo() async {
    try {
      return {
        'Device ID': await DeviceUtils.getDeviceId(),
        'Device Name': await DeviceUtils.getDeviceName(),
        'OS Version': await DeviceUtils.getOsVersion(),
        'App Version': await DeviceUtils.getAppVersion(),
        'Package Name': await DeviceUtils.getPackageName(),
        'Device Type': await DeviceUtils.getDeviceType(),
        'Is Mobile': DeviceUtils.isMobile().toString(),
        'Is Desktop': DeviceUtils.isDesktop().toString(),
        'Is Web': DeviceUtils.isWeb().toString(),
      };
    } catch (e) {
      return {'Error': 'Failed to get device info: $e'};
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
