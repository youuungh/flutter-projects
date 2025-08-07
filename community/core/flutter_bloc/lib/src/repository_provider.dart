import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowRepositoryProvider<DataT> extends RepositoryProvider<DataT> {
  FlowRepositoryProvider({
    required super.create,
    super.key,
    super.child,
    super.lazy,
  });

  FlowRepositoryProvider.value({required super.value, super.key, super.child})
    : super.value();

  static DataT of<DataT>(BuildContext context, {bool listen = false}) {
    return RepositoryProvider.of<DataT>(context, listen: listen);
  }
}

extension FlowRepositoryProviderContext on BuildContext {
  DataT readFlowRepository<DataT>() {
    return read<DataT>();
  }

  DataT watchFlowRepository<DataT>() {
    return watch<DataT>();
  }
}
