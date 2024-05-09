import 'package:flutter/material.dart';
import 'package:movie_list/common/base/base_view_model.dart';
import 'package:movie_list/common/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

typedef Create<T> = T Function();

abstract class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    required this.vm,
    super.key,
  });
  final Create<T> vm;

  Widget build(BuildContext context, T vm);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late final T vm;

  @override
  void initState() {
    super.initState();

    vm = widget.vm();
  }

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      body: ChangeNotifierProvider<T>(
        create: (x) => vm,
        builder: (context, _) {
          final vm = context.watch<T>();
          if (vm.state == VMState.error) {
            return Center(
              child: Text(
                vm.stateError,
                style: context.textTheme.titleLarge,
              ),
            );
          }
          return vm.state.isLoaded
              ? widget.build(context, vm)
              : const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
