import 'package:flutter/material.dart';
import 'package:store_go/core/constants/ui.dart';
import 'package:store_go/core/theme/color_extension.dart';

extension StyledButton   on Widget {
  Widget secondaryButton(
    BuildContext context, {
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    final colors = Theme.of(context).extension<AppColorExtension>();
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: UIConstants.fontSizeMedium,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: colors?.secondary,
        foregroundColor: colors?.secondaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIConstants.borderRadiusCircular),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: UIConstants.paddingMedium,
        ),
      ),
      child:
          isLoading
              ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colors?.secondaryForeground ?? Colors.white,
                  ),
                ),
              )
              : this,
    );
  }
}
