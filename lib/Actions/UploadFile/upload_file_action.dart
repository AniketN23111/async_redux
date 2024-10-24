import 'dart:async';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/Loading/is_product_loaded_action.dart';
import 'package:last_step/Actions/Loading/is_product_loading_action.dart';
import 'package:last_step/Constants/locator.dart';
import 'package:last_step/Constants/response_api.dart';
import 'package:last_step/Services/data_service.dart';
import 'package:last_step/app_state.dart';

class UploadFileAction extends ReduxAction<AppState> {
  DataService dataService = locator();
  final Uint8List fileBytes;
  final String fileName;

  UploadFileAction(this.fileBytes, this.fileName);

  @override
  Future<AppState> reduce() async {
    ResponseApi responseApi = await dataService.uploadFile(fileBytes, fileName);
    return state.copy(responseApi: responseApi);
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
