import 'package:cletus_reyes/services/product_service.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});

  dynamic product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: AppThemes.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
              width: double.infinity,
            ),
            Container(
              height: 300,
              child: Image.network(
                product['filePath'],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product['category']['name'],
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              //'\$${product.price.toStringAsFixed(2)}',
              '\$ ${product['price'].toStringAsFixed(2)} MX',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppThemes.primary,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product['description'] ?? 'No hay datos para este producto',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Categoría: Guantes',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tamaño: 16oz',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Add your delete logic here
                deleteProduct(product['id']).then((value) {
                  //Navigator.pop(context);
                  Navigator.pushNamed(context, '/products');
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 16, bottom: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                backgroundColor: AppThemes.primary,
              ),
              child: const Text('Eliminar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
