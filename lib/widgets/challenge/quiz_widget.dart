import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/widgets/challenge/answer_widget.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AnswerWidget(
            text:
                'uisdfh soidfh hso hfhf sofh sfho ioefo osf oisf is fius  gf guae gueg ererg  og grj gaerg ag ihg a er gh',
          ),
          AnswerWidget(
            text:
                'uisdfh soidfh hso hfhf sofh sfho ioefo osf oisf is fius  gf guae gueg ererg  og grj gaerg ag ihg a er gh',
          ),
          AnswerWidget(
            isRight: true,
            isSelected: true,
            text:
                'uisdfh soidfh hso hfhf sofh sfho ioefo osf oisf is fius  gf guae gueg ererg  og grj gaerg ag ihg a er gh',
          ),
          AnswerWidget(
            text:
                'uisdfh soidfh hso hfhf sofh sfho ioefo osf oisf is fius  gf guae gueg ererg  og grj gaerg ag ihg a er gh',
          ),
        ],
      ),
    );
  }
}
