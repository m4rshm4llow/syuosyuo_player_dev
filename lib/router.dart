import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:syuosyuo_player_dev/gen/assets.gen.dart';
import 'package:syuosyuo_player_dev/pages/achives_screen.dart';
import 'package:syuosyuo_player_dev/pages/artists_screen.dart';
import 'package:syuosyuo_player_dev/pages/credit_screen.dart';
import 'package:syuosyuo_player_dev/pages/home_screen.dart';
import 'package:syuosyuo_player_dev/pages/main_scaffold.dart';
import 'package:syuosyuo_player_dev/pages/search_screen.dart';
import 'package:syuosyuo_player_dev/pages/songs_screen.dart';
import 'package:syuosyuo_player_dev/pages/thumbnail_screen.dart';
import 'package:syuosyuo_player_dev/pages/tool_screen.dart';
import 'package:syuosyuo_player_dev/pages/watch_screen.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: kDebugMode,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.mochiSyuoCrying.image(width: 128),
            Text('404 Not Found', style: Theme.of(context).textTheme.headlineSmall),
            Gap(8),
            Text('ご指定のページが見つかりません。', style: Theme.of(context).textTheme.bodyLarge),
            Gap(64),
            TextButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    );
  },
);

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(routes: [TypedGoRoute<HomePageRoute>(path: '/')]),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ArtistsPageRoute>(path: '/artists'),
        TypedGoRoute<SearchPageRoute>(path: '/search'),
        TypedGoRoute<AchivesPageRoute>(path: '/archives'),
        TypedGoRoute<SongPageRoute>(path: '/songs'),
        TypedGoRoute<ThumbnailPageRoute>(path: '/thumbnails'),
        TypedGoRoute<WatchPageRoute>(path: '/watch'),
        TypedGoRoute<CreditPageRoute>(path: '/credit'),
        TypedGoRoute<ToolPageRoute>(path: '/tool'),
      ],
    ),
  ],
)
class ShellRouteData extends StatefulShellRouteData {
  const ShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return SelectionArea(child: MainScaffold(navigationShell: navigationShell));
  }
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class ArtistsPageRoute extends GoRouteData {
  const ArtistsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ArtistsScreen();
  }
}

class SearchPageRoute extends GoRouteData {
  const SearchPageRoute({this.q});

  final String? q;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(query: q);
  }
}

class SongPageRoute extends GoRouteData {
  const SongPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SongsScreen();
  }
}

class ThumbnailPageRoute extends GoRouteData {
  const ThumbnailPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ThumbnailScreen();
  }
}

class AchivesPageRoute extends GoRouteData {
  const AchivesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AchivesScreen();
  }
}

class WatchPageRoute extends GoRouteData {
  const WatchPageRoute({required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WatchScreen(videoId: videoId);
  }
}

class CreditPageRoute extends GoRouteData {
  const CreditPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreditScreen();
  }
}

class ToolPageRoute extends GoRouteData {
  const ToolPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ToolScreen();
  }
}
