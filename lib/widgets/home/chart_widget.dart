import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(
              strokeWidth: 10,
              value: 0.75,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
        ),
        Center(
          child: Text(
            '75%',
            style: AppTextStyles.heading,
          ),
        )
      ],
    );
  }
}
