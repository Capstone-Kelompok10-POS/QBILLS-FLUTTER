import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pos_capstone/check.dart';
import 'package:pos_capstone/viewmodel/view_model_add_membership.dart';
import 'package:pos_capstone/viewmodel/view_model_chatbot.dart';
import 'package:pos_capstone/viewmodel/view_model_login.dart';
import 'package:pos_capstone/viewmodel/view_model_membership.dart';
import 'package:pos_capstone/viewmodel/view_model_product.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginVM()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => MembershipProvider()),
        ChangeNotifierProvider(create: (context) => MembershipViewModel()),
        ChangeNotifierProvider(create: (context) => ChatbotProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Check(),
      ),
    );
  }
}
