import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key, required this.products });

  final Future<dynamic> products;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
            var products = snapshot.hasData ? snapshot.data : [];
            return SliverGrid( 
              delegate: SliverChildListDelegate([...products.map((product) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/DescriptionScreen', arguments: product);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/DescriptionScreen', arguments: product);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/cargando.gif',
                              image: product['filePath'].replaceAll("https:://", "https:/"),
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8), 
                        Center(
                          child: Text(
                            product['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: Text(
                            "Desde \$ ${product['price']} MXN",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))], ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            );
        });
  }
}
