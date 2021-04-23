import 'package:flutter/material.dart';

import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    required this.isSelected,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  Color get _selectedColorRigth =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRigth =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRigth =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRigth =>
      awnser.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRigth =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRigth => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(awnser.isRight);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRigth : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRigth
                        : AppColors.border),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(awnser.title,
                        style: isSelected
                            ? _selectedTextStyleRigth
                            : AppTextStyles.body)),
                SizedBox(width: 8),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRigth : AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedBorderRigth
                            : AppColors.border)),
                  ),
                  child: isSelected
                      ? Icon(
                          _selectedIconRigth,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
