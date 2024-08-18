// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return MyHomePage();
    },
  );
}

/// generated route for
/// [RiverpodPage]
class RiverpodRoute extends PageRouteInfo<RiverpodRouteArgs> {
  RiverpodRoute({
    required String id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RiverpodRoute.name,
          args: RiverpodRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RiverpodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RiverpodRouteArgs>();
      return RiverpodPage(
        args.id,
        key: args.key,
      );
    },
  );
}

class RiverpodRouteArgs {
  const RiverpodRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'RiverpodRouteArgs{id: $id, key: $key}';
  }
}
