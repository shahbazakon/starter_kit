import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/spacing.dart';

/// Primary button component with WeChat-inspired design
class PrimaryButton extends StatelessWidget {
  /// Button label text
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Icon to display before the text
  final IconData? icon;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button takes full width
  final bool fullWidth;

  /// Button size
  final ButtonSize size;

  /// Creates a primary button
  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
    this.size = ButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildButton(
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
      textColor: AppColors.white,
      disabledTextColor: AppColors.white.withOpacity(0.7),
    );
  }

  /// Build the button with specified colors
  Widget _buildButton({
    required Color backgroundColor,
    required Color disabledBackgroundColor,
    required Color textColor,
    required Color disabledTextColor,
  }) {
    final isDisabled = onPressed == null || isLoading;

    final buttonHeight =
        size == ButtonSize.small
            ? 32.0
            : size == ButtonSize.medium
            ? 44.0
            : 52.0;

    final buttonTextStyle =
        size == ButtonSize.small
            ? AppTextStyles.buttonSmall
            : size == ButtonSize.medium
            ? AppTextStyles.buttonMedium
            : AppTextStyles.buttonLarge;

    final buttonPadding =
        size == ButtonSize.small
            ? const EdgeInsets.symmetric(horizontal: 12)
            : size == ButtonSize.medium
            ? const EdgeInsets.symmetric(horizontal: 16)
            : const EdgeInsets.symmetric(horizontal: 24);

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDisabled ? disabledBackgroundColor : backgroundColor,
          foregroundColor: isDisabled ? disabledTextColor : textColor,
          padding: buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight / 2),
          ),
          elevation: 0,
        ),
        child:
            isLoading
                ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  ),
                )
                : _buildButtonContent(textColor, buttonTextStyle),
      ),
    );
  }

  /// Build the button content with icon and text
  Widget _buildButtonContent(Color textColor, TextStyle textStyle) {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 18),
          AppSpacing.horizontalXS,
          Text(text, style: textStyle),
        ],
      );
    }
    return Text(text, style: textStyle);
  }
}

/// Secondary button component with WeChat-inspired design
class SecondaryButton extends PrimaryButton {
  /// Creates a secondary button
  const SecondaryButton({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
    bool isLoading = false,
    bool fullWidth = false,
    ButtonSize size = ButtonSize.medium,
  }) : super(
         key: key,
         text: text,
         onPressed: onPressed,
         icon: icon,
         isLoading: isLoading,
         fullWidth: fullWidth,
         size: size,
       );

  @override
  Widget build(BuildContext context) {
    return _buildButton(
      backgroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.white,
      textColor: AppColors.primary,
      disabledTextColor: AppColors.grey,
    );
  }
}

/// Outline button component with WeChat-inspired design
class OutlineButton extends PrimaryButton {
  /// Creates an outline button
  const OutlineButton({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    IconData? icon,
    bool isLoading = false,
    bool fullWidth = false,
    ButtonSize size = ButtonSize.medium,
  }) : super(
         key: key,
         text: text,
         onPressed: onPressed,
         icon: icon,
         isLoading: isLoading,
         fullWidth: fullWidth,
         size: size,
       );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(
          color:
              onPressed == null || isLoading
                  ? AppColors.grey
                  : AppColors.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            size == ButtonSize.small
                ? 16.0
                : size == ButtonSize.medium
                ? 22.0
                : 26.0,
          ),
        ),
        padding:
            size == ButtonSize.small
                ? const EdgeInsets.symmetric(horizontal: 12)
                : size == ButtonSize.medium
                ? const EdgeInsets.symmetric(horizontal: 16)
                : const EdgeInsets.symmetric(horizontal: 24),
      ),
      child: Container(
        height:
            size == ButtonSize.small
                ? 32.0
                : size == ButtonSize.medium
                ? 44.0
                : 52.0,
        width: fullWidth ? double.infinity : null,
        alignment: Alignment.center,
        child:
            isLoading
                ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                )
                : _buildButtonContent(
                  onPressed == null ? AppColors.grey : AppColors.primary,
                  size == ButtonSize.small
                      ? AppTextStyles.buttonSmall
                      : size == ButtonSize.medium
                      ? AppTextStyles.buttonMedium
                      : AppTextStyles.buttonLarge,
                ),
      ),
    );
  }
}

/// Text button component with WeChat-inspired design
class TextBtn extends StatelessWidget {
  /// Button label text
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Icon to display before the text
  final IconData? icon;

  /// Text color
  final Color? color;

  /// Creates a text button
  const TextBtn({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.primary;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      child:
          icon != null
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 16, color: buttonColor),
                  AppSpacing.horizontalXXS,
                  Text(
                    text,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: buttonColor,
                    ),
                  ),
                ],
              )
              : Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(color: buttonColor),
              ),
    );
  }
}

/// Icon button component with WeChat-inspired design
class IconBtn extends StatelessWidget {
  /// Icon to display
  final IconData icon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Icon color
  final Color? color;

  /// Icon size
  final double size;

  /// Creates an icon button
  const IconBtn({
    Key? key,
    required this.icon,
    this.onPressed,
    this.color,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color ?? AppColors.primary, size: size),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: size * 0.8,
    );
  }
}

/// Button size enum
enum ButtonSize {
  /// Small button (height: 32)
  small,

  /// Medium button (height: 44)
  medium,

  /// Large button (height: 52)
  large,
}
