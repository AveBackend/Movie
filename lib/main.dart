import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth_widgets.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(backgroundColor: const Color.fromRGBO(3, 37, 65, 1.0)),
        useMaterial3: true,
      ),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/auth',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(
                  'Page not found',
                  style: TextStyle(color: Colors.black),
                ),
              ));
        });
      },
    );
  }
}
