import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const _dbName = 'app_armazenamento.db';
  static const _dbVersion = 1;

  static Database? _database;

  DbHelper._init();

  static Future<Database> get db async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE IF NOT EXISTS quotes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  quote TEXT NOT NULL,
  author TEXT NOT NULL
);
''');
      },
    );
  }
}
