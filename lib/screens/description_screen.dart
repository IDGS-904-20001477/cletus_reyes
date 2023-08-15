import 'package:cletus_reyes/provider/products_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productService = ProductsProvider();
    final Map<String, dynamic>? product =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (product != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Column(
          children: [
            Text(product['name']),
            Text('\$${product['price']} MXN'),
            Text('${product['description']}'),
            Text('Stock minimo: ${product['minValue']}'),
            Text('Stock maximo: ${product['maxValue']}'),
            Text('Cantidad: ${product['quantity']}'),
            Text(product['size']['size']),
            Text('Categoria: ${product['category']['name']}'),
            ElevatedButton(
              onPressed: () async {
                final productId = product['id']; 
                try {
                  await productService.deleteProduct(productId: productId);
                  Navigator.pop(context);
                } catch (e) {
                  print('Error al eliminar el producto: $e');
                }
              }, 
              child: const Text('Eliminar')
            ),

          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error: No product data available.'),
        ),
      );
    }
  }
}
