import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';

const int kModelInitDelayMs = 100;

class StateProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Function(T) onModelInit;
  final Function(T) onModelDispose;

  StateProvider({this.child, this.onModelInit, this.onModelDispose});

  @override
  _StateProviderState<T> createState() => _StateProviderState<T>();
}

class _StateProviderState<T extends ChangeNotifier>
    extends State<StateProvider<T>> {
  T model = locator<T>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: kModelInitDelayMs)).then((_) {
      if (mounted && widget.onModelInit != null) {
        widget.onModelInit(model);
      }
    });
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) {
      widget.onModelDispose(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: widget.child,
    );
  }
}
