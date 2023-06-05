import 'package:cakecraft/screens/PhotoUploadScreen.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var isDarkModeEnabled = false;
  /* FacebookAuthentication facebookAuthentication = FacebookAuthentication();*/
  UserModel userModel = new UserModel();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      userModel = ModalRoute.of(context)!.settings.arguments as UserModel;
    }
    //Theme_provider Theme = Provider.of<Theme_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CakeCraft!!!')),
      ),
      body: PhotoUploadScreen(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(userModel.photoURL ??
                      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
                ),
                accountName: Text(userModel.name ?? 'Nombre del usuario'),
                accountEmail: Text(userModel.email ?? 'Correo del usuario')),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              title: const Text('Registrarse'),
              subtitle: const Text('Registro de usuario'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/theme');
              },
              title: const Text('Apariencia'),
              subtitle: const Text('Descubre los temas nuevos!'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              title: const Text('Cerrar sesión'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
