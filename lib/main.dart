import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_manage/pages/account_page.dart';
import 'package:user_manage/pages/login_page.dart';
import 'package:user_manage/pages/splash_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  final url = dotenv.env['PROJECT_URL'];
  final anon = dotenv.env['ANON_KEY'];
  if (url != null && anon != null) {
    await Supabase.initialize(
      url: url, 
      anonKey: anon,
      authFlowType: AuthFlowType.pkce,
    );
  } 
  
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (_) => const SplashPage(),
        '/login' : (_) => const LoginPage(),
        '/account' : (_) => const AccountPage(),
      },
    );
  }
}