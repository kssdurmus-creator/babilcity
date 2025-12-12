import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/home_screen.dart';
import 'services/premium_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env", mergeWith: {});
  runApp(BabiApp());
}

class AppState extends ChangeNotifier {
  bool _isPremium = false;
  bool get isPremium => _isPremium;
  void setPremium(bool v) { _isPremium = v; notifyListeners(); }
}

class BabiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(primary: Color(0xFF5B8CFF), secondary: Color(0xFF2CE6C4)),
      scaffoldBackgroundColor: Color(0xFF06060A),
      cardColor: Color(0xFF0F0F12),
      useMaterial3: true,
    );
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BabiLEvreni',
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: dark,
        themeMode: ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }
}