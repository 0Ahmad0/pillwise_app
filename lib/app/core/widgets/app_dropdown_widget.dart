import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDropdownButtonWidget<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final String? Function(T?)? validator;
  final TextInputAction? textInputAction;
  final VoidCallback? onFieldSubmitted;
  final IconData? prefixIcon;
  final bool enabled;
  final bool autofocus;
  final Widget? icon;
  final double iconSize;
  final bool isExpanded;

  const AppDropdownButtonWidget({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.hintText,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.enabled = true,
    this.autofocus = false,
    this.icon,
    this.iconSize = 24.0,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;

    final borderRadius = BorderRadius.circular(8.r);

    final baseBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: theme.dividerColor, width: 0.1),
    );

    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      isExpanded: isExpanded,
      hint: Text(
        hintText ?? '',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.hintColor,
        ),
      ),
      icon: icon ?? Icon(Icons.keyboard_arrow_down, size: iconSize),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        errorMaxLines: 2,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: theme.iconTheme.color,
              )
            : null,
        filled: true,
        fillColor: enabled
            ? (theme.inputDecorationTheme.fillColor ??
                theme.colorScheme.surface.withOpacity(0.5))
            : theme.disabledColor.withOpacity(0.3),
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: BorderSide(color: theme.primaryColor, width: 1),
        ),
        errorBorder: baseBorder.copyWith(
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
        ),
        focusedErrorBorder: baseBorder.copyWith(
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
        ),
      ),
      onTap: onFieldSubmitted,
      dropdownColor: theme.cardColor,
      borderRadius: borderRadius,
    );
  }
}
