import 'package:cletus_reyes/services/auth_service.dart';
import 'package:cletus_reyes/services/product_service.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:cletus_reyes/util/api_util.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.product});

  dynamic product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showDeleteButton = false;
  @override
  void initState() {
    getUser().then((value) {
      setState(() {
        showDeleteButton = value['rol'] == 'Admin';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.product['filePath']);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
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
                child: FadeInImage(
                  image: NetworkImage(
                    // 'no_image_available.png'
                    widget.product['filePath'],
                  ),
                  placeholder:
                      const AssetImage('assets/no_image_available.png'),
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 24),
            Text(
              widget.product['category']['name'],
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              //'\$${product.price.toStringAsFixed(2)}',
              '\$ ${widget.product['price'].toStringAsFixed(2)} MX',
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
                widget.product['description'] ??
                    'No hay datos para este producto',
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
            const SizedBox(height: 8.0),
            Text(
              "Existencias: ${widget.product['quantity']}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24.0),
            if (showDeleteButton)
              ElevatedButton(
                onPressed: () {
                  // Add your delete logic here
                  _showConfirmationDialog(context, widget.product);
                  /*deleteProduct(product['id']).then((value) {
                  //Navigator.pop(context);
                  Navigator.pushNamed(context, '/products');
                });*/
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

  void _showConfirmationDialog(BuildContext context, product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Producto'),
          content: const Text('¿Estás seguro de que deseas continuar?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Acción a realizar si se cancela
                //Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                // Agregar aquí la lógica para cancelar
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                backgroundColor: AppThemes.primary,
              ),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar si se confirma
                // Agregar aquí la lógica para continuar
                deleteProduct(product['id']).then((value) {
                  //Navigator.pop(context);
                  Navigator.pushNamed(context, '/products');
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                backgroundColor: AppThemes.secondary,
              ),
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
