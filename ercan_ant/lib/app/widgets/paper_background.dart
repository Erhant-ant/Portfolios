import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';

class PaperBackground extends StatelessWidget {
  const PaperBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: .045,
              child: Image.asset(
                'assets/images/paper_texture.png',
                repeat: ImageRepeat.repeat,
                fit: BoxFit.none,
                filterQuality: FilterQuality.low,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
