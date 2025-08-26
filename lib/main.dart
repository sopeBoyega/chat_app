import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


const supabaseUrl ='https://xnsidjyiepgaecpmymtr.supabase.co';
const supabaseKey ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhuc2lkanlpZXBnYWVjcG15bXRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYxMjMzMDksImV4cCI6MjA3MTY5OTMwOX0.XnIvE95aqa57dwxwADTCoSDHEfuhZl7Z_ereGLeo5zY";

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);


runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 79, 237)),
      ),
      // Similar to the future builder widget
      // 
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }
         if (snapshot.hasData) {
          return ChatScreen();
         }

         return const AuthScreen();
      })
    );
  }
}