import 'package:SecondLife/widgets/state/StateProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateProviderConsumer<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Widget child;
  final Function(T) onModelInit;
  final Function(T) onModelDispose;

  StateProviderConsumer(
      {this.builder, this.onModelInit, this.onModelDispose, this.child});

  @override
  _StateProviderConsumerState<T> createState() =>
      _StateProviderConsumerState<T>();
}

class _StateProviderConsumerState<T extends ChangeNotifier>
    extends State<StateProviderConsumer<T>> {
  @override
  Widget build(BuildContext context) {
    return StateProvider<T>(
      onModelInit: widget.onModelInit,
      onModelDispose: widget.onModelDispose,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
