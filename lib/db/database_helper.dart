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

    await db.execute('''
CREATE TABLE profile(
id INTEGER PRIMARY KEY AUTOINCREMENT,
full_name TEXT,
profile_photo TEXT,
profession TEXT,
bio TEXT,
mobile_number TEXT,
address TEXT,
linkedin TEXT,
github TEXT,
facebook TEXT,
instagram TEXT,
twitter TEXT
)
''');
  }

  Future<int> signup(String username, String email, String password) async {
    var client = await db;

    return await client.insert('users', {
      'username': username,
      'email': email,
      'password': password,
    });
  }

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

  Future<int> insertProfile(Map<String, dynamic> profile) async {
    var client = await db;

    return client.insert('profile', profile);
  }

  Future<List<Map<String, dynamic>>> getAllProfiles() async {
    var client = await db;
    return client.query('profile');
  }

  Future<Map<String, dynamic>?> getProfileById(int id) async {
    var client = await db;
    final result = await client.query(
      'profile',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> updateProfile(int id, Map<String, dynamic> updatedProfile) async {
    var client = await db;
    return client.update(
      'profile',
      updatedProfile,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteProfile(int id) async {
    var client = await db;
    return client.delete('profile', where: 'id = ?');
  }

  //closing database
  Future closeDatabase() async {
    var client = await db;
    return await client.close();
  }
}
