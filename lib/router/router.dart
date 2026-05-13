import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/author_profile_page.dart';
import '../pages/post_detail_page.dart';
import '../pages/post_list_page.dart';
import '../pages/post_write_page.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PostListPage(),
      ),
      GoRoute(
        path: '/write',
        builder: (context, state) => const PostWritePage(),
      ),
      GoRoute(
        path: '/post/:postId',
        builder: (context, state) => PostDetailPage(
          postId: state.pathParameters['postId']!,
        ),
      ),
      GoRoute(
        path: '/author/:authorId',
        builder: (context, state) => AuthorProfilePage(
          authorId: state.pathParameters['authorId']!,
        ),
      ),
    ],
  );
}
