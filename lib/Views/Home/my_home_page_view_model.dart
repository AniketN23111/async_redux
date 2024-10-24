import 'dart:ui';

import 'package:async_redux/async_redux.dart';

import '../../Actions/Home/my_home_page_increment_action.dart';
import '../../app_state.dart';
import 'my_home_page_connector.dart';

/// A view-model is a helper object to a [StoreConnector] widget. It holds the
/// part of the Store state the corresponding dumb-widget needs, and may also
/// convert this state part into a more convenient format for the dumb-widget
/// to work with.
///
/// You must implement equals/hashcode for the view-model class to work.
/// Otherwise, the [StoreConnector] will think the view-model changed everytime,
/// and thus will rebuild everytime. This won't create any visible problems
/// to your app, but is inefficient and may be slow.
///
/// By extending the [Vm] class you can implement equals/hashcode without
/// having to override these methods. Instead, simply list all fields
/// (which are not immutable, like functions) to the [equals] parameter
/// in the constructor.
///
class MyHomePageViewModel extends Vm {
  final int counter;
  final VoidCallback onIncrement;

  MyHomePageViewModel({
    required this.counter,
    required this.onIncrement,
  }) : super(equals: [counter]);
}

class Factory
    extends VmFactory<AppState, MyHomePageConnector, MyHomePageViewModel> {
  Factory(connector) : super(connector);

  @override
  MyHomePageViewModel fromStore() => MyHomePageViewModel(
        counter: state.counter,
        onIncrement: () => dispatch(IncrementAction(amount: 1)),
      );
}
