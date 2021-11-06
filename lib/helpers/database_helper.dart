import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../components/constants.dart';
import '../model/user_model.dart';

class DbHelper {
  /// create a instance private of class(DatabaseHelper)
  DbHelper._();
  static final DbHelper db = DbHelper._();

  /// create a variable of Database
  Database? _database;

  /// Singleton
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database?> initDatabase() async {
    /// Create a Path
    String path = join(await getDatabasesPath(), "UserData.db");

    /// Initialize Database And Create The Table
    return await openDatabase(path, version: 1,
        onCreate: (Database? database, int version) async {
      await database!.execute('''
      CREATE TABLE $TABLE_USER (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      phone TEXT NOT NULL,
      color INTEGER NOT NULL
      )
      ''');
    });
  }

  /// CRUD => Create , Read , Update , Delete
  /// Create
  // هذه الدالة تقوم بارجاع ال id الخاصة بالمستخدم
  Future<int> insertDbUser(UserModel userModel) async {
    Database? dbUser = await database;
    return await dbUser!.insert(
      TABLE_USER,
      userModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Read
  /// GET One User
  Future<UserModel?> getOneUser(int id) async {
    Database? dbUser = await database;
    List<Map<String, dynamic>> data =
        await dbUser!.query(TABLE_USER, where: 'id ?', whereArgs: [id]);
    if (data.isNotEmpty) {
      return UserModel.fromJson(data.first);
    } else {
      return null;
    }
  }

  /// Read
  /// GET All Users
  Future<List<UserModel>?> getAllUsers() async {
    Database? dbUser = await database;
    List<Map<String, dynamic>> data = await dbUser!.query(TABLE_USER);
    if (data.isNotEmpty) {
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      return null;
    }
  }

  /// Update
  Future<int> updateDb(UserModel userModel) async {
    Database? dbUser = await database;
    return await dbUser!.update(
      TABLE_USER,
      userModel.toMap(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  /// Delete => One User
  Future<int> deleteDb(int id) async {
    Database? dbUser = await database;
    return dbUser!.delete(TABLE_USER, where: 'id = ?', whereArgs: [id]);
  }
}
