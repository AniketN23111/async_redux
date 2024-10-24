import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/Loading/is_product_loaded_action.dart';
import 'package:last_step/Actions/Loading/is_product_loading_action.dart';
import 'package:last_step/Constants/locator.dart';
import 'package:last_step/Constants/response_api.dart';
import 'package:last_step/Model/product_response.dart';
import 'package:last_step/Services/data_service.dart';
import 'package:last_step/app_state.dart';

class DeleteSingleProductAction extends ReduxAction<AppState> {
  final ProductResponse productResponse;
  DataService dataService = locator();

  DeleteSingleProductAction({required this.productResponse});

  @override
  Future<AppState> reduce() async {
    ResponseApi responseApi = await dataService.deleteProduct(productResponse);
    ProductResponse newResponse = ProductResponse.fromJson(responseApi.data);
    return state.copy(productResponse: newResponse);
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
