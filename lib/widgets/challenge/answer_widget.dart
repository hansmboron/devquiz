import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String text;
  final bool isRight;
  final bool isSelected;

  const AnswerWidget(
      {Key? key,
      required this.text,
      this.isRight = false,
      this.isSelected = false})
      : super(key: key);

  Color get _selectedColorRigth =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRigth =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRigth =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRigth =>
      isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRigth =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRigth => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRigth : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
                color:
                    isSelected ? _selectedBorderCardRigth : AppColors.border),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(text,
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
                    color:
                        isSelected ? _selectedBorderRigth : AppColors.border)),
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
    );
  }
}
