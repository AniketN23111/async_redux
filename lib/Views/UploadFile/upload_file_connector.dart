import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:last_step/Views/UploadFile/upload_file.dart';
import 'package:last_step/Views/UploadFile/upload_file_view_model.dart';

class UploadFileConnector extends StatelessWidget {
  final bool? isLoading;
  const UploadFileConnector({super.key, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      vm: () => Factory(this),
      builder: (context, UploadFileViewModel vm) => UploadFile(
        onUploadFile: vm.onUploadFile,
        isLoading: vm.isLoading,
      ),
    );
  }
}
