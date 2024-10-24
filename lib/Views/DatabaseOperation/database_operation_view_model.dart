import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:last_step/Actions/DatabaseOperation/databae_operation_get_all_product_action.dart';
import 'package:last_step/Model/product_response.dart';
import 'package:last_step/Views/DatabaseOperation/database_operation_connector.dart';
import 'package:last_step/app_state.dart';

class DatabaseOperationViewModel extends Vm {
  final VoidCallback getAllProduct;
  final List<ProductResponse> listproduct;
  final bool isLoading;
  DatabaseOperationViewModel(
      {required this.getAllProduct,
      required this.listproduct,
      required this.isLoading})
      : super(equals: [listproduct, isLoading]);
}

class Factory extends VmFactory<AppState, DataBaseOperationConnector,
    DatabaseOperationViewModel> {
  Factory(connector) : super(connector);

  @override
  DatabaseOperationViewModel fromStore() => DatabaseOperationViewModel(
      getAllProduct: () => dispatch(GetAllProductAction()),
      listproduct: state.listproduct,
      isLoading: state.loading);
}
