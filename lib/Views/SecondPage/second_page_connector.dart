import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:last_step/Views/SecondPage/second_page.dart';
import 'package:last_step/app_state.dart';
import 'package:last_step/Views/SecondPage/second_page_view_model.dart';

class SecondPageConnector extends StatelessWidget {
  const SecondPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SecondPageViewModel>(
      vm: () => Factory(),
      builder: (BuildContext context, SecondPageViewModel vm) => SecondPage(
        counter: vm.counter,
        onChangePage: vm.onChangePage,
        decrementCounter: vm.decrementCounter,
      ),
    );
  }
}
