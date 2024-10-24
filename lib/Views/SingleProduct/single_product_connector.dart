import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:last_step/Model/product_response.dart';
import 'package:last_step/Views/SingleProduct/single_product.dart';
import 'package:last_step/Views/SingleProduct/single_product_view_model.dart';

class SingleProductConnector extends StatelessWidget {
  final bool? isLoading;
  final ProductResponse? productResponse;

  const SingleProductConnector(
      {super.key, this.isLoading, this.productResponse});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      vm: () => Factory(this),
      builder: (context, SingleProductViewModel vm) => SingleProduct(
        productResponse: vm.productResponse,
        getProduct: () => vm.getProduct(productResponse!),
        deleteProduct: () => vm.deleteProduct(productResponse!),
        updateProduct: () => vm.updateProduct(vm.productResponse),
        isLoading: vm.isLoading,
      ),
    );
  }
}
