import 'package:devquiz/controllers/home_controller.dart';
import 'package:devquiz/controllers/home_state.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/widgets/home/app_bar_widget.dart';
import 'package:devquiz/widgets/home/level_button_widget.dart';
import 'package:devquiz/widgets/home/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          height: _size.height * 0.36,
          user: controller.user!,
        ),
        body: Column(
          children: [
            SizedBox(height: _size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height * 0.03),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: controller.quizzes!
                    .map(
                      (e) => QuizCardWidget(
                        title: e.title,
                        completed:
                            "${e.questionAnswered}/ ${e.questions.length}",
                        percent: e.questionAnswered / e.questions.length,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
