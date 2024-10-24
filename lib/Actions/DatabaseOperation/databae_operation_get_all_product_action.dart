import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/Loading/is_product_loaded_action.dart';
import 'package:last_step/Actions/Loading/is_product_loading_action.dart';
import 'package:last_step/Constants/locator.dart';
import 'package:last_step/Model/product_response.dart';
import 'package:last_step/Services/data_service.dart';
import 'package:last_step/app_state.dart';

class GetAllProductAction extends ReduxAction<AppState> {
  DataService dataService = locator();
  @override
  Future<AppState> reduce() async {
    List<ProductResponse> productlist = [];
    var productResponse = await dataService.getAllProduct();
    productResponse.data.forEach((e) {
      ProductResponse response = ProductResponse.fromJson(e);
      productlist.add(response);
    });

    return state.copy(listproduct: productlist);
  }

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
