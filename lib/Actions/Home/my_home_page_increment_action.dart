import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/Loading/is_product_loaded_action.dart';
import 'package:last_step/Actions/Loading/is_product_loading_action.dart';

import '../../app_state.dart';

/// This action increments the counter by [amount]].
class IncrementAction extends ReduxAction<AppState> {
  final int amount;

  IncrementAction({required this.amount});

  @override
  AppState reduce() => state.copy(counter: state.counter + amount);

  @override
  void after() {
    dispatch(IsProductLoadedAction());
    super.after();
  }

  @override
  void before() {
    dispatch(IsProductLoadingAction());
    super.before();
  }
}
