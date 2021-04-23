import 'package:flutter/material.dart';

import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/widgets/challenge/next_button.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;
  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool _isPortrait = MediaQuery.of(context).orientation.index == 0;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _isPortrait
                ? Image.asset(
                    AppImages.trophy,
                    scale: 1.3,
                  )
                : Container(),
            SizedBox(height: _size.height * 0.05),
            Text(
              'Parabéns!',
              style: AppTextStyles.heading40,
            ),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                  text: 'Você concluiu',
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(text: '\n$title', style: AppTextStyles.bodyBold),
                    TextSpan(
                      text: '\nCom $result de $length acertos!',
                      style: AppTextStyles.body,
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: _size.height * 0.1),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              width: double.maxFinite,
              child: NextButtonWidget.purple(
                label: 'Compartilhar',
                onTap: () {
                  Share.share(
                      'DEVQUIZ - Resultado do quiz: $title\nObtive ${(result ~/ length)}% de aproveitamento!');
                },
              ),
            ),
            SizedBox(height: _size.height * 0.03),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              width: double.maxFinite,
              child: NextButtonWidget.white(
                label: 'Voltar ao Início',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
