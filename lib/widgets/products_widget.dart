import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ProductsCardWidget extends StatelessWidget {
  const ProductsCardWidget({super.key, required this.pokemon});

  final Future<dynamic> pokemon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pokemon,
        builder: (context, snapshot) {
            var pokemon = snapshot.hasData ? snapshot.data: [];
            return Padding(
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
                    FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/cargando.gif',
                      image: pokemon['sprites']['front_default'],
                    ),
                    Text(
                      pokemon['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "N.° ${pokemon['id'].toString().padLeft(4, '0')}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...pokemon['types'].map((type) => Padding(
                              padding: const EdgeInsets.all(4),
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: AppThemes.second,
                                    side:
                                        BorderSide(color: AppThemes.second)),
                                child: Text(type['type']['name']),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
        });
  }
}
