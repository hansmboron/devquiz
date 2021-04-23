import 'package:devquiz/controllers/challenge_controller.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:devquiz/widgets/challenge/next_button.dart';
import 'package:devquiz/widgets/challenge/question_indicator_widget.dart';
import 'package:devquiz/widgets/challenge/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final _pageController = PageController();

  @override
  void initState() {
    if (controller.currentPage < widget.questions.length)
      _pageController.addListener(() {
        controller.currentPage = _pageController.page!.toInt() + 1;
      });
    super.initState();
  }

  void nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(94),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: BackButton(),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: widget.questions[0],
                  onChange: nextPage,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value < widget.questions.length)
                        Expanded(
                          child: NextButtonWidget.white(
                            label: 'Pular',
                            onTap: nextPage,
                          ),
                        ),
                      if (value == widget.questions.length)
                        Expanded(
                          child: NextButtonWidget.green(
                            label: 'Confirmar',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                    ],
                  )),
        ),
      ),
    );
  }
}
