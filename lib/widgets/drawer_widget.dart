import 'package:cletus_reyes/routes/app_routes.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    initPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
              margin: const EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                  color: AppThemes.primary,
                  image: const DecorationImage(
                      image: AssetImage('assets/logo_white.png'),
                      fit: BoxFit.contain)),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text('v 1.0', style: TextStyle(color: Colors.white)),
              )),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final menuItem = AppRoutes.menu[index];
              return ListTile(
                leading: menuItem['icon'],
                title: Text(menuItem['name']),
                onTap: () {
                  Navigator.pushNamed(context, menuItem['router']);
                },
              );
            },
            separatorBuilder: (__, _) => const Divider(),
            itemCount: AppRoutes.menu.length,
          )
        ],
      ),
    );
  }
}
