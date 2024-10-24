import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:last_step/Views/DatabaseOperation/database_operation.dart';
import 'package:last_step/Views/DatabaseOperation/database_operation_view_model.dart';

class DataBaseOperationConnector extends StatelessWidget {
  const DataBaseOperationConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      vm: () => Factory(this),
      builder: (context, DatabaseOperationViewModel vm) => DatabaseOperation(
        getAllProduct: vm.getAllProduct,
        response: vm.listproduct,
        isLoading: vm.isLoading,
      ),
    );
  }
}
