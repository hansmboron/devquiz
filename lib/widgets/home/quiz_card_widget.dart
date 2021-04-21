import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/Widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: _size.width * 0.03),
          Text('Gerenciamento de Estado', style: AppTextStyles.heading15),
          SizedBox(height: _size.width * 0.03),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('3/10', style: AppTextStyles.body11),
              ),
              Expanded(flex: 3, child: ProgressIndicatorWidget(value: 0.3)),
            ],
          )
        ],
      ),
    );
  }
}
