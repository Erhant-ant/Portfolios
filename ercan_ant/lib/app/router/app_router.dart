import 'package:ercan_ant/features/about/presentation/about_page.dart';
import 'package:ercan_ant/features/blog/presentation/blog_detail_page.dart';
import 'package:ercan_ant/features/blog/presentation/blog_page.dart';
import 'package:ercan_ant/features/home/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/kitaplar',
      // extra: true sinyali HomePage'e kitaplar bölümüne scroll yapmasını söyler
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/blog',
      builder: (context, state) => const BlogPage(),
    ),
    GoRoute(
      path: '/blog/:id',
      builder: (context, state) => BlogDetailPage(
        postId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/hakkinda',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/iletisim',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);
