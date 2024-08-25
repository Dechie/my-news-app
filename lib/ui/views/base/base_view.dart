import 'package:flutter/material.dart';
import 'package:my_news_app/core/viewModels/base/base_view_movel.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

/// the basic abstracted value of views. it wraps the scaffold widget
/// with a [ChangeNotifierProvider] which takes a generic type [T].
/// T is a subclass of [BaseViewModel].
/// This widget is stateful because it contains state related implementations
/// that make use of [setState]. So any view that inherits from this widget
/// will have an "onReady" method that acts just like a stateful widget,
/// without necessarily being stateful widget.
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T) onModelReady;

  const BaseView({
    super.key,
    required this.builder,
    required this.onModelReady,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
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
