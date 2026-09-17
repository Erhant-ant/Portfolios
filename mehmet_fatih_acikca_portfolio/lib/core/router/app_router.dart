
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/layout/main_layout.dart';
import '../../presentation/pages/about_page.dart';
import '../../presentation/pages/contact_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/reviews_page.dart';
import '../../presentation/pages/services_page.dart';
import '../../presentation/pages/videos_page.dart';

class AppRouter {
  // Animasyonlu sayfa geçişleri için yardımcı fonksiyon
  static CustomTransitionPage _fadeTransition(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          // Tüm sayfaları saran ana iskelet
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(path: '/', pageBuilder: (context, state) => _fadeTransition(state, const HomePage())),
          GoRoute(path: '/hakkimda', pageBuilder: (context, state) => _fadeTransition(state, const AboutPage())),
          GoRoute(path: '/hizmetler', pageBuilder: (context, state) => _fadeTransition(state, const ServicesPage())),
          GoRoute(path: '/videolar', pageBuilder: (context, state) => _fadeTransition(state, const VideosPage())),
          GoRoute(path: '/yorumlar', pageBuilder: (context, state) => _fadeTransition(state, const ReviewsPage())),
          GoRoute(path: '/iletisim', pageBuilder: (context, state) => _fadeTransition(state, const ContactPage())),
        ],
      ),
    ],
  );
}