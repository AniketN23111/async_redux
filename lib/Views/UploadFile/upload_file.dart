import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadFile extends StatefulWidget {
  final void Function(Uint8List fileBytes, String fileName) onUploadFile;
  final bool isLoading;
  const UploadFile(
      {super.key, required this.onUploadFile, required this.isLoading});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  Uint8List? fileBytes;
  String fileName = "";
  Future<void> _pickAndUploadImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(withData: true);
    if (result == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file picked'),
          backgroundColor: Color.fromARGB(255, 27, 161, 50),
        ),
      );
      return;
    }
    setState(() {
      fileBytes = result.files.first.bytes;
      fileName = result.names.first!;
    });
    widget.onUploadFile(fileBytes!, fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Uplaod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : Text(fileName),
              ElevatedButton(
                onPressed: _pickAndUploadImage,
                child: const Text('File Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
