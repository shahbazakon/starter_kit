import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/spacing.dart';

/// Text input component with WeChat-inspired design
class AppTextField extends StatelessWidget {
  /// Controller for the text field
  final TextEditingController? controller;

  /// Hint text to display when the field is empty
  final String? hintText;

  /// Label text to display above the field
  final String? labelText;

  /// Helper text to display below the field
  final String? helperText;

  /// Error text to display below the field
  final String? errorText;

  /// Whether the field is required
  final bool isRequired;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether the field is obscured (for passwords)
  final bool obscureText;

  /// Input type for the field
  final TextInputType? keyboardType;

  /// Callback when the text changes
  final ValueChanged<String>? onChanged;

  /// Callback when the field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Callback when the field is tapped
  final VoidCallback? onTap;

  /// Maximum length of the text
  final int? maxLength;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Input formatters for the field
  final List<TextInputFormatter>? inputFormatters;

  /// Focus node for the field
  final FocusNode? focusNode;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final IconData? suffixIcon;

  /// Callback when suffix icon is tapped
  final VoidCallback? onSuffixIconTap;

  /// Creates a text field
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.isRequired = false,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label text if provided
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              if (isRequired) ...[
                AppSpacing.horizontalXXS,
                Text(
                  '*',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ],
          ),
          AppSpacing.verticalXXS,
        ],

        // Text field
        TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          enabled: enabled,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          inputFormatters: inputFormatters,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            errorText: errorText,
            errorStyle: AppTextStyles.error,
            helperText: helperText,
            helperStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textTertiary,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            prefixIcon:
                prefixIcon != null
                    ? Icon(prefixIcon, color: AppColors.grey, size: 20)
                    : null,
            suffixIcon:
                suffixIcon != null
                    ? IconButton(
                      icon: Icon(suffixIcon, color: AppColors.grey, size: 20),
                      onPressed: onSuffixIconTap,
                    )
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            filled: true,
            fillColor:
                enabled
                    ? AppColors.white
                    : AppColors.lightGrey.withValues(alpha: 0.5),
            counterText: '',
          ),
        ),
      ],
    );
  }
}

/// Search input component with WeChat-inspired design
class AppSearchField extends StatelessWidget {
  /// Controller for the search field
  final TextEditingController? controller;

  /// Hint text to display when the field is empty
  final String hintText;

  /// Callback when the text changes
  final ValueChanged<String>? onChanged;

  /// Callback when the field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Callback when the clear button is tapped
  final VoidCallback? onClear;

  /// Focus node for the field
  final FocusNode? focusNode;

  /// Creates a search field
  const AppSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: AppTextStyles.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.grey, size: 20),
        suffixIcon:
            controller != null && controller!.text.isNotEmpty
                ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    controller!.clear();
                    if (onClear != null) {
                      onClear!();
                    } else if (onChanged != null) {
                      onChanged!('');
                    }
                  },
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.lightGrey.withValues(alpha: 0.5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

/// Dropdown field component with WeChat-inspired design
class AppDropdownField<T> extends StatelessWidget {
  /// Current value of the dropdown
  final T? value;

  /// List of items to display in the dropdown
  final List<DropdownMenuItem<T>> items;

  /// Hint text to display when no value is selected
  final String? hintText;

  /// Label text to display above the field
  final String? labelText;

  /// Helper text to display below the field
  final String? helperText;

  /// Error text to display below the field
  final String? errorText;

  /// Whether the field is required
  final bool isRequired;

  /// Whether the field is enabled
  final bool enabled;

  /// Callback when the value changes
  final ValueChanged<T?>? onChanged;

  /// Creates a dropdown field
  const AppDropdownField({
    super.key,
    this.value,
    required this.items,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.isRequired = false,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label text if provided
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              if (isRequired) ...[
                AppSpacing.horizontalXXS,
                Text(
                  '*',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ],
          ),
          AppSpacing.verticalXXS,
        ],

        // Dropdown field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: errorText != null ? AppColors.error : AppColors.border,
            ),
            color:
                enabled
                    ? AppColors.white
                    : AppColors.lightGrey.withValues(alpha: 0.5),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<T>(
                value: value,
                items: items,
                onChanged: enabled ? onChanged : null,
                isExpanded: true,
                hint:
                    hintText != null
                        ? Text(
                          hintText!,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        )
                        : null,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.grey,
                ),
                style: AppTextStyles.bodyMedium,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ),

        // Error or helper text
        if (errorText != null) ...[
          AppSpacing.verticalXXS,
          Text(errorText!, style: AppTextStyles.error),
        ] else if (helperText != null) ...[
          AppSpacing.verticalXXS,
          Text(
            helperText!,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ],
    );
  }
}
