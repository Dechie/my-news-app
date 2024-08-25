import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T) onModelReady;

  const BaseView({
    super.key,
    required this.builder,
    required this.onModelReady,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T viewModel = locator<T>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.onModelReady(viewModel);
  }
}
