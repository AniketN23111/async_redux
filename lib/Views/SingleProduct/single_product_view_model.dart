import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/SingleProduct/delete_single_product_action.dart';
import 'package:last_step/Actions/SingleProduct/single_product_action.dart';
import 'package:last_step/Actions/SingleProduct/update_single_product_action.dart';
import 'package:last_step/Model/product_response.dart';
import 'package:last_step/Views/SingleProduct/single_product_connector.dart';
import 'package:last_step/app_state.dart';

// ignore: must_be_immutable
class SingleProductViewModel extends Vm {
  late void Function(ProductResponse productResponse) getProduct;
  late void Function(ProductResponse productResponse) deleteProduct;
  late void Function(ProductResponse productResponse) updateProduct;
  late ProductResponse productResponse;
  final bool isLoading;
  SingleProductViewModel(
      {required this.getProduct,
      required this.updateProduct,
      required this.deleteProduct,
      required this.productResponse,
      required this.isLoading})
      : super(equals: [productResponse, isLoading]);
}

class Factory extends VmFactory<AppState, SingleProductConnector,
    SingleProductViewModel> {
  Factory(connector) : super(connector);

  @override
  SingleProductViewModel? fromStore() => SingleProductViewModel(
        getProduct: (productResponse) =>
            dispatch(SingleProductAction(productResponse: productResponse)),
        productResponse: state.productResponse,
        isLoading: state.loading,
        updateProduct: (productResponse) => dispatch(
            UpdateSingleProductAction(productResponse: state.productResponse)),
        deleteProduct: (productID) => dispatch(
            DeleteSingleProductAction(productResponse: state.productResponse)),
      );
}
