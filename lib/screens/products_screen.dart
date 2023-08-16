import 'package:cletus_reyes/services/product_service.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:cletus_reyes/widgets/drawer_widget.dart';
import 'package:cletus_reyes/widgets/product_list_widget.dart';
import 'package:cletus_reyes/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerWidget(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black87,
              expandedHeight: 260,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  child: const Text(
                    'Productos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                background: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('bg-products-header.jpg'),
                  image: AssetImage('bg-products-header.jpg'),
                ),
              ),
            ),
            FutureBuilder(
              future: getProducts(),
              builder: (context, snapshot) {
                var products = snapshot.hasData ? snapshot.data : [];
                return SliverGrid(
                  delegate: SliverChildListDelegate(
                    [
                      ...products!
                          .map((product) => ProductCard(product: product))
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                );
              },
            )
          ],
        ));
    /*return Scaffold(
      endDrawer: const DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: const Text(
                  'PRODUCTOS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              background: const FadeInImage(
                fit: BoxFit.fill,
                placeholder: AssetImage('cargando.gif'),
                image: AssetImage('logo.png'),
              ),
            ),
          ),
          ProductListWidget(products: getProducts()),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          /*FocusScope.of(context).unfocus();
          await Future.delayed(
            const Duration(seconds: 2),
          );
          await UtilProvider.rtp.clearSession();
          Navigator.pushNamed(context, '/LoginScreen');*/
        },
        child: const Text('Salir'),
      ),
    );
    */
  }
}
