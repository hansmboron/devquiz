import 'package:flutter/material.dart';

import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/models/awnser_model.dart';
import 'package:devquiz/models/question_model.dart';

import 'answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnser(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(milliseconds: 500))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
