import 'package:last_step/Constants/response_api.dart';
import 'package:last_step/Model/product_response.dart';

class AppState {
  final int counter;
  final ProductResponse productResponse;
  final List<ProductResponse> listproduct;
  final bool loading;

  AppState(
      {required this.counter,
      required this.productResponse,
      required this.listproduct,
      required this.loading});

  AppState copy(
          {int? counter,
          ProductResponse? productResponse,
          List<ProductResponse>? listproduct,
          bool? loading,
          ResponseApi? responseApi}) =>
      AppState(
          counter: counter ?? this.counter,
          productResponse: productResponse ?? this.productResponse,
          listproduct: listproduct ?? this.listproduct,
          loading: loading ?? this.loading);
  static AppState initState() => AppState(
        counter: 0,
        productResponse: ProductResponse(),
        listproduct: List.empty(),
        loading: false,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          counter == other.counter &&
          productResponse == other.productResponse &&
          listproduct == other.listproduct &&
          loading == other.loading;
  @override
  int get hashCode =>
      counter.hashCode ^
      productResponse.hashCode ^
      listproduct.hashCode ^
      loading.hashCode;
}
