import 'package:cletus_reyes/provider/products_provider.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:cletus_reyes/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/util_provider.dart';
import '../widgets/product_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productService = ProductsProvider();

    return Scaffold(
      endDrawer: const DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppThemes.primary,
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
          ProductListWidget(
            products: productService.getProducts(url: 'https://localhost:7088/api/Product')
            ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          await Future.delayed(
            const Duration(seconds: 2),
          );
          await UtilProvider.rtp.clearSession();
          Navigator.pushNamed(context, '/LoginScreen');
        },
        child: const Text('Salir'),
      ),
    );
  }
}
