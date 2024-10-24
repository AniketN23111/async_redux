import 'package:flutter/material.dart';
import 'package:last_step/Constants/response_api.dart';
import 'package:last_step/Model/product_response.dart';

class SingleProduct extends StatefulWidget {
  final ProductResponse? productResponse;
  final ResponseApi? responseApi;
  final void Function() getProduct;
  final void Function() updateProduct;
  final void Function() deleteProduct;
  final bool? isLoading;
  const SingleProduct(
      {super.key,
      this.productResponse,
      this.responseApi,
      required this.getProduct,
      required this.isLoading,
      required this.updateProduct,
      required this.deleteProduct});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _categoryController = TextEditingController();
    widget.getProduct();
  }

  @override
  void didUpdateWidget(covariant SingleProduct oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.productResponse != null &&
        widget.productResponse != oldWidget.productResponse) {
      _updateTextControllers();
    }
  }

  void _updateTextControllers() {
    setState(() {
      _titleController.text = widget.productResponse?.title ?? '';
      _descriptionController.text = widget.productResponse?.description ?? '';
      _priceController.text = widget.productResponse?.price?.toString() ?? '';
      _categoryController.text = widget.productResponse?.category ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: widget.isLoading == null || widget.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : widget.productResponse == null
                  ? const Center(
                      child: Text('No Data Found'),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ID: ${widget.productResponse!.id}"),
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(labelText: 'Title'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the title';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the description';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _priceController,
                          decoration: const InputDecoration(labelText: 'Price'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the price';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _categoryController,
                          decoration:
                              const InputDecoration(labelText: 'Category'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the category';
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: widget.updateProduct,
                                child: const Text('Update Product')),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                onPressed: widget.deleteProduct,
                                child: const Text('Delete Product')),
                          ],
                        )
                      ],
                    ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
