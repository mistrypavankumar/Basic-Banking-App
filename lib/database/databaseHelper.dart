import 'package:basic_banking_app/model/transectionDetails.dart';
import 'package:basic_banking_app/model/userData.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'bankingsystem.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE userdetails(id INTEGER PRIMARY KEY, userName TEXT,cardNumber VARCHAR,cardExpiry TEXT,totalAmount DOUBLE)");

        await db.execute(
            "CREATE TABLE transectionsData(id INTEGER PRIMARY KEY,transectionId INTEGER,userName TEXT,transectionAmount DOUBLE)");

        return db;
      },
      version: 1,
    );
  }

  Future<void> insertUserDetails(UserData userdata) async {
    final Database _db = await database();
    await _db.insert('userdetails', userdata.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertTransectionHistroy(
      TransectionDetails transectionDetails) async {
    Database _db = await database();
    await _db.insert('transectionsData', transectionDetails.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateTotalAmount(int id, double totalAmount) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE userDetails SET totalAmount = '$totalAmount' WHERE id = '$id'");
  }

  Future<List<UserData>> getUserDetails() async {
    final Database _db = await database();
    final List<Map<String, dynamic>> userMap = await _db.query('userdetails');
    return List.generate(
      userMap.length,
      (index) {
        return UserData(
          id: userMap[index]['id'],
          userName: userMap[index]['userName'],
          cardNumber: userMap[index]['cardNumber'],
          cardExpiry: userMap[index]['cardExpiry'],
          totalAmount: userMap[index]['totalAmount'],
        );
      },
    );
  }

  Future<List<UserData>> getUserDetailsList(int userId) async {
    final Database _db = await database();
    List<Map<String, dynamic>> userMap =
        await _db.rawQuery("SELECT * FROM userDetails WHERE id != $userId");
    return List.generate(userMap.length, (index) {
      return UserData(
        id: userMap[index]['id'],
        userName: userMap[index]['userName'],
        cardNumber: userMap[index]['cardNumber'],
        cardExpiry: userMap[index]['cardExpiry'],
        totalAmount: userMap[index]['totalAmount'],
      );
    });
  }

  Future<List<TransectionDetails>> getTransectionDetatils() async {
    Database _db = await database();
    final List<Map<String, dynamic>> trasectionMap =
        await _db.rawQuery("SELECT * FROM transectionsData");
    return List.generate(trasectionMap.length, (index) {
      return TransectionDetails(
        id: trasectionMap[index]['id'],
        userName: trasectionMap[index]['userName'],
        transectionId: trasectionMap[index]['transectionId'],
        transectionAmount: trasectionMap[index]["transectionAmount"],
      );
    });
  }

  Future<void> updateTransectionIsDone(int id, int transectionDone) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE transections SET transectionDone = '$transectionDone' WHERE id = '$id'");
  }
}
