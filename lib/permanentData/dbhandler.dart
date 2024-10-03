import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler{
  static DatabaseHandler handler = DatabaseHandler();
  late final Database database;

  DatabaseHandler(){
    initialize();
  }

  initialize() async{
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'dnd_beyonder.db'),
    );
  }

  static int getNewId(){
    return 0;
  }
}