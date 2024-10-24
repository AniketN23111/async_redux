import 'package:async_redux/async_redux.dart';
import 'package:last_step/app_state.dart';

class IsProductLoadingAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copy(loading: true);
}
