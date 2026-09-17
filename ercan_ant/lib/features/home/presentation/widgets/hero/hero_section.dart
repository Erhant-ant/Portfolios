import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/home/presentation/widgets/hero/hero_book.dart';
import 'package:ercan_ant/features/home/presentation/widgets/hero/hero_content.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 1000;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFCF8F1), Color(0xffF8F3EB), Color(0xffF3ECE2)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -180,
                left: -120,
                child: Container(
                  width: 420,
                  height: 420,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD8C6A3).withValues(alpha: .08),
                  ),
                ),
              ),

              Positioned(
                bottom: -220,
                right: -120,
                child: Container(
                  width: 520,
                  height: 520,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffB89362).withValues(alpha: .06),
                  ),
                ),
              ),

              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1450),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile
                          ? AppSpacing.xl
                          : AppSpacing.xxxl * 1.5,
                      vertical: isMobile ? 56 : 72,
                    ),
                    child: isMobile
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroBook(),
                              SizedBox(height: 48),
                              HeroContent(),
                            ],
                          )
                        : const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 6, child: HeroContent()),
                              SizedBox(width: 56),
                              Expanded(flex: 5, child: HeroBook()),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
