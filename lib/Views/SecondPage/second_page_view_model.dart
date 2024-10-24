import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/SecondPage/second_page_decrement_action.dart';
import 'package:last_step/Constants/route_names.dart';
import 'package:last_step/Views/SecondPage/second_page_connector.dart';
import 'package:last_step/app_state.dart';

class SecondPageViewModel extends Vm {
  final VoidCallback onChangePage;
  final int counter;
  final VoidCallback decrementCounter;

  SecondPageViewModel(
      {required this.onChangePage,
      required this.counter,
      required this.decrementCounter})
      : super(equals: [counter]);
}

class Factory
    extends VmFactory<AppState, SecondPageConnector, SecondPageViewModel> {
  @override
  SecondPageViewModel fromStore() => SecondPageViewModel(
        counter: state.counter,
        onChangePage: () =>
            dispatch(NavigateAction.pushNamed(RoutesNames.myHomePage)),
        decrementCounter: () => dispatch(DecrementAction(total: 1)),
      );
}
