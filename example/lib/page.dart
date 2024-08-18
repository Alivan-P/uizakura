import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:example/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uizakura/uizakura.dart';

/// @author luwenjie on 2024/7/27 23:37:23

@RoutePage()
class RiverpodPage extends UizakuraPage {
  final String id;

  const RiverpodPage(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _State();
  }
}

class _State extends UizakuraPageState<RiverpodPage> {
  late ViewModelProvider<ViewModel, String> _provider = provider(ProviderKey(
    arg: widget.id,
  ));

  ViewModel get _viewModel => getViewModel(_provider);

  String get _state => getState(_provider);

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _viewModel.setId();
      }),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            appRouter.maybePop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _state,
            style: TextStyle(color: Colors.red),
          ),
          FilledButton(
              onPressed: () async {
                debugPrint("page._viewModel = ${_viewModel.hashCode}");
              },
              child: Text("invalide not change id")),
          FilledButton(
              onPressed: () async {
                refreshProvider(_provider);
                // setState(() {
                //
                // });
                // _updateViewModel();
              },
              child: Text("invalide with change id")),
          FilledButton(
              onPressed: () {
                debugPrint("page._viewModel = ${_viewModel.hashCode}");
                debugPrint("page.state = ${_viewModel.state}");
              },
              child: Text("call viewmodel")),
        ],
      ),
    );
  }
}

class RefreshProvider {
  final AutoDisposeStateNotifierProvider<ViewModel, String> provider;
  final ViewModel viewModel;

  RefreshProvider(this.provider, this.viewModel);
}

final ViewModelProviderBuilder<ViewModel, String, ProviderKey<String>>
    provider =
    buildViewModelProvider<ViewModel, String, String>(viewModel: (v) {
  final id = v.requireArg;
  return ViewModel("", id);
});

class ViewModel extends UizakuraViewModel<String> {
  final String id;

  ViewModel(super.state, this.id) {
    debugPrint("create ViewModel ${id} ${this.hashCode}");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose ViewModel ${id} ${this.hashCode}");
  }

  void setId() {
    update((s) => Random().nextInt(200).toString());
  }
}
