import 'package:cletus_reyes/screens/screen_export.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: 'loading.gif',
              image: product['filePath'],
            ),*/
            Image.network(
              product['filePath'],
              fit: BoxFit.cover,
              height: 120,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              product['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                              product: product,
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  backgroundColor: AppThemes.primary,
                ),
                child: const Text('Ver Más'))
            /*Text(
              product['category']['name'],
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
