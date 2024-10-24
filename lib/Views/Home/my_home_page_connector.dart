import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:last_step/app_state.dart';

import 'my_home_page.dart';
import 'my_home_page_view_model.dart';

/// This widget is a connector.
/// It connects the store to [Home] (the dumb-widget).
/// Each time the state changes, it creates a view-model, and compares it
/// with the view-model created with the previous state.
/// Only if the view-model changed, the connector rebuilds.
class MyHomePageConnector extends StatelessWidget {
  const MyHomePageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyHomePageViewModel>(
      vm: () => Factory(this),
      builder: (context, MyHomePageViewModel vm) => MyHomePage(
        counter: vm.counter,
        onIncrement: vm.onIncrement,
      ),
    );
  }
}
