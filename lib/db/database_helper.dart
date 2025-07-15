import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  //DAtabase Connection
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'portfolio.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE users(
id INTEGER PRIMARY KEY AUTOINCREMENT,
username TEXT,
email TEXT,
password TEXT
)
''');
  }

  //Insert data to users table

  Future<int> signup(String username, String email, String password) async {
    var client = await db;

    return await client.insert('users', {
      'username': username,
      'email': email,
      'password': password,
    });
  }

  //Login
  Future<Map<String, dynamic>?> signin(String email, String password) async {
    var client = await db;

    List<Map<String, dynamic>> result = await client.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  //user exist or not
  Future<bool> checkUserExist(String email) async {
    var client = await db;

    List<Map<String, dynamic>> result = await client.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return true;
    }
    return false;
  }

  //closing database
  Future closeDatabase() async {
    var client = await db;
    return await client.close();
  }
}
