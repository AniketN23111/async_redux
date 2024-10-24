import 'package:async_redux/async_redux.dart';
import 'package:last_step/app_state.dart';

class DecrementAction extends ReduxAction<AppState> {
  final int total;
  DecrementAction({required this.total});

  @override
  AppState reduce() => state.copy(counter: state.counter - total);

  @override
  void after() {
    // TODO: implement after
    super.after();
  }

  @override
  void before() {
    // TODO: implement Before
    super.before();
  }
}
