import 'package:flutter/material.dart';
import 'package:last_step/Constants/route_names.dart';
import 'package:last_step/Model/product_response.dart';

class DatabaseOperation extends StatefulWidget {
  final VoidCallback? getAllProduct;
  final List<ProductResponse>? response;
  final bool? isLoading;

  const DatabaseOperation(
      {super.key, this.getAllProduct, this.response, this.isLoading});

  @override
  State<DatabaseOperation> createState() => _DatabaseOperationState();
}

class _DatabaseOperationState extends State<DatabaseOperation> {
  @override
  void initState() {
    super.initState();
    widget.getAllProduct!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        leading: IconButton(
          onPressed: widget.getAllProduct,
          icon: const Icon(Icons.file_copy),
        ),
      ),
      body: widget.isLoading == null || widget.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : widget.response == null || widget.response!.isEmpty
              ? const Center(
                  child: Text('No Data Found'),
                )
              : ListView.builder(
                  itemCount: widget.response!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.response![index].title ?? "No title"),
                      subtitle:
                          Text('₹${widget.response![index].price ?? 0.0}'),
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.singleProduct,
                            arguments: widget.response![index]);
                      },
                    );
                  },
                ),
    );
  }
}
