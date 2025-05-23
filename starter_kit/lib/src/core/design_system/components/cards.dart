import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/spacing.dart';

/// Card component with WeChat-inspired design
class AppCard extends StatelessWidget {
  /// Child widget to display in the card
  final Widget child;

  /// Padding inside the card
  final EdgeInsetsGeometry? padding;

  /// Margin around the card
  final EdgeInsetsGeometry? margin;

  /// Border radius of the card
  final BorderRadius? borderRadius;

  /// Background color of the card
  final Color? backgroundColor;

  /// Border color of the card
  final Color? borderColor;

  /// Elevation of the card
  final double elevation;

  /// Whether the card is clickable
  final bool isClickable;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Creates a card
  const AppCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 1.0,
    this.isClickable = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardContent = Container(
      padding: padding ?? AppSpacing.paddingMD,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: child,
    );

    if (isClickable || onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Material(
          color: Colors.transparent,
          elevation: elevation,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          child: cardContent,
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: cardContent,
    );
  }
}

/// List card component with WeChat-inspired design
class AppListCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Subtitle of the card
  final String? subtitle;

  /// Leading widget to display before the title
  final Widget? leading;

  /// Trailing widget to display after the title
  final Widget? trailing;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Padding inside the card
  final EdgeInsetsGeometry? padding;

  /// Margin around the card
  final EdgeInsetsGeometry? margin;

  /// Border radius of the card
  final BorderRadius? borderRadius;

  /// Background color of the card
  final Color? backgroundColor;

  /// Border color of the card
  final Color? borderColor;

  /// Elevation of the card
  final double elevation;

  /// Creates a list card
  const AppListCard({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      isClickable: onTap != null,
      onTap: onTap,
      child: ListTile(
        leading: leading,
        title: Text(title, style: AppTextStyles.bodyMedium),
        subtitle:
            subtitle != null
                ? Text(
                  subtitle!,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                )
                : null,
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

/// Info card component with WeChat-inspired design
class AppInfoCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Content of the card
  final Widget content;

  /// Footer widget to display at the bottom of the card
  final Widget? footer;

  /// Icon to display before the title
  final IconData? icon;

  /// Action button to display in the header
  final Widget? action;

  /// Padding inside the card
  final EdgeInsetsGeometry? padding;

  /// Margin around the card
  final EdgeInsetsGeometry? margin;

  /// Border radius of the card
  final BorderRadius? borderRadius;

  /// Background color of the card
  final Color? backgroundColor;

  /// Border color of the card
  final Color? borderColor;

  /// Elevation of the card
  final double elevation;

  /// Creates an info card
  const AppInfoCard({
    Key? key,
    required this.title,
    required this.content,
    this.footer,
    this.icon,
    this.action,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: AppColors.primary, size: 20),
                  AppSpacing.horizontalXS,
                ],
                Expanded(child: Text(title, style: AppTextStyles.h5)),
                if (action != null) action!,
              ],
            ),
          ),

          // Divider
          const Divider(height: 1),

          // Content
          Padding(padding: const EdgeInsets.all(16), child: content),

          // Footer if provided
          if (footer != null) ...[
            const Divider(height: 1),
            Padding(padding: const EdgeInsets.all(16), child: footer!),
          ],
        ],
      ),
    );
  }
}

/// Status card component with WeChat-inspired design
class AppStatusCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Status text to display
  final String status;

  /// Status color
  final Color statusColor;

  /// Description text
  final String? description;

  /// Icon to display
  final IconData? icon;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Padding inside the card
  final EdgeInsetsGeometry? padding;

  /// Margin around the card
  final EdgeInsetsGeometry? margin;

  /// Border radius of the card
  final BorderRadius? borderRadius;

  /// Background color of the card
  final Color? backgroundColor;

  /// Border color of the card
  final Color? borderColor;

  /// Elevation of the card
  final double elevation;

  /// Creates a status card
  const AppStatusCard({
    Key? key,
    required this.title,
    required this.status,
    required this.statusColor,
    this.description,
    this.icon,
    this.onTap,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 1.0,
  }) : super(key: key);

  /// Creates a success status card
  factory AppStatusCard.success({
    required String title,
    String status = 'Success',
    String? description,
    IconData? icon = Icons.check_circle,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double elevation = 1.0,
  }) {
    return AppStatusCard(
      title: title,
      status: status,
      statusColor: AppColors.success,
      description: description,
      icon: icon,
      onTap: onTap,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
    );
  }

  /// Creates an error status card
  factory AppStatusCard.error({
    required String title,
    String status = 'Error',
    String? description,
    IconData? icon = Icons.error,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double elevation = 1.0,
  }) {
    return AppStatusCard(
      title: title,
      status: status,
      statusColor: AppColors.error,
      description: description,
      icon: icon,
      onTap: onTap,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
    );
  }

  /// Creates a warning status card
  factory AppStatusCard.warning({
    required String title,
    String status = 'Warning',
    String? description,
    IconData? icon = Icons.warning,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double elevation = 1.0,
  }) {
    return AppStatusCard(
      title: title,
      status: status,
      statusColor: AppColors.warning,
      description: description,
      icon: icon,
      onTap: onTap,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding ?? AppSpacing.paddingMD,
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      isClickable: onTap != null,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, color: statusColor, size: 24),
            AppSpacing.horizontalMD,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: AppTextStyles.h5),
                AppSpacing.verticalXXS,
                Text(
                  status,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (description != null) ...[
                  AppSpacing.verticalXS,
                  Text(
                    description!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
