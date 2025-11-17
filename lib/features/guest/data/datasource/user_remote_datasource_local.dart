import 'package:news_indo_app/core/error/exceptions.dart';
import 'package:news_indo_app/features/guest/domain/entities/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class UserRemoteDatasourceLocal {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getCachedUser();
  Future<void> clearCache();
}

class UserRemoteDatasourceLocalImpl implements UserRemoteDatasourceLocal {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'auth.db');

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        uid TEXT NOT NULL UNIQUE,
        email TEXT,
        displayName TEXT,
        photoURL TEXT
      )
    ''');
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      final db = await database;
      await db.insert('users', {
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw CachedException();
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final db = await database;
      await db.delete('users');
    } catch (e) {
      throw CachedException();
    }
  }

  @override
  Future<UserModel> getCachedUser() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('users', limit: 1);
      if (maps.isEmpty) throw CachedException();

      final map = maps.first;
      return UserModel(
        uid: map['uid'] as String,
        email: map['email'] as String?,
        displayName: map['displayName'] as String?,
        photoURL: map['photoURL'] as String?,
      );
    } catch (e) {
      throw CachedException();
    }
  }
}
