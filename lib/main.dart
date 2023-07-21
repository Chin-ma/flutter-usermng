import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_manage/pages/account_page.dart';
import 'package:user_manage/pages/login_page.dart';
import 'package:user_manage/pages/splash_page.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://mmqdkmmmznmdodmlgemc.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1tcWRrbW1tem5tZG9kbWxnZW1jIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk5MjExNTksImV4cCI6MjAwNTQ5NzE1OX0.f04BHTvkaE2Fs1DxEeJ8SPr26wtmA2Gzoc6zJMMmbLY',
    authFlowType: AuthFlowType.pkce,
  );
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