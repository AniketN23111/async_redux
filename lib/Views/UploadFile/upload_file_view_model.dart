import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:last_step/Actions/UploadFile/upload_file_action.dart';
import 'package:last_step/Views/UploadFile/upload_file_connector.dart';

import '../../app_state.dart';

// ignore: must_be_immutable
class UploadFileViewModel extends Vm {
  late void Function(Uint8List fileBytes, String fileName) onUploadFile;
  final bool isLoading;

  UploadFileViewModel({required this.onUploadFile, required this.isLoading})
      : super(equals: [isLoading]);
}

class Factory
    extends VmFactory<AppState, UploadFileConnector, UploadFileViewModel> {
  Factory(connector) : super(connector);

  @override
  UploadFileViewModel? fromStore() => UploadFileViewModel(
      isLoading: state.loading,
      onUploadFile: (fileBytes, fileName) =>
          dispatch(UploadFileAction(fileBytes, fileName)));
}
