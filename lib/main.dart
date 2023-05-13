import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:provider/provider.dart';
import 'models/ordered_item.dart';
import 'package:food_delivery/screens/registration_screen.dart';
import 'package:food_delivery/screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderedItemData>(
      create: (context) => OrderedItemData(),
      child: MaterialApp(
        title: 'Food Delivery',
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          MyHomePage.id: (context) => const MyHomePage(),
          LoginScreen.id: (context) => const LoginScreen(),
          RegistrationScreen.id: (context) => const RegistrationScreen()
        },
      ),
    );
  }
}
