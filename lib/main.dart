import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/album/album_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    /// to close the splash screen after a certain delay
    hideScreen();
  }

  Future<void> hideScreen() async {
    Future.delayed(const Duration(milliseconds: 800), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// to setup necessary providers used in the app
      providers: [
        ChangeNotifierProvider<AlbumDataProvider>(
          create: (context) => AlbumDataProvider(),
        ),
        ChangeNotifierProvider<PhotoDataProvider>(
          create: (context) => PhotoDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MT Gallery App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            fontFamily: "rubik"),

        /// album list screen will be the home screen
        home: const AlbumScreen(),
      ),
    );
  }
}
