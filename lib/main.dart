import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yin/screens/create_poem_screen.dart';
import 'package:yin/screens/home_screen.dart';
import 'package:yin/screens/poem_tune_detail_screen.dart';
import 'package:yin/services/db/repository.dart';
import 'package:yin/services/poen_tune_service.dart';

import 'services/database_factory.dart';
import 'theme/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = [
    Provider<Database>.value(value: await SqliteFactory.createInstance("data.db", "assets/data/init.sql")),
    ProxyProvider<Database, SqliteRepository>(
      update: (_, db, repository) => SqliteRepository(db),
    ),
    ProxyProvider<SqliteRepository, PoemTuneService>(
      update: (_, repository, service) => PoemTuneService(repository),
    ),
  ];

  runApp(MultiProvider(
    providers: providers,
    child: MaterialApp(
      title: "好吟",
      theme: globalTheme,
      routes: {
        "/": (_) => HomeScreen(),
        "/song_poem/create": (_) => CreatePoemScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/poem_tune/detail":
            {
              int id = settings.arguments;
              return MaterialPageRoute(builder: (context) => PoemTuneDetailScreen(id));
            }
          default:
            break;
        }
        return null;
      },
    ),
  ));
}
