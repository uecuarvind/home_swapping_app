/*
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../app/data/apis/api_constants/api_key_constants.dart';
import 'db_constants.dart';

class DBHelper {
  static Database? database;

  DBHelper._privateConstructor();

  static DBHelper dbHelperInstance = DBHelper._privateConstructor();

  List<Map<String, Object?>> customer = [];

  factory DBHelper() {
    return dbHelperInstance;
  }

  Future<Database?> openDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), DBConstant.dbName),
      onCreate: (db, version) async {
        await createTable(db: db);
      },
      version: DBConstant.version,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute("DROP TABLE IF EXISTS ${DBConstant.tableName}");
          await createTable(db: db);
        }
      },
    );
    return database;
  }

  closeDB() async {
    Database? database = await openDB();
    database?.close();
  }

  createTable({required Database db}) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS ${DBConstant.tableName} (
        ${DBConstant.columnId} ${DBDataType.number},
        ${DBConstant.columnCustomerId} ${DBDataType.text},
        ${DBConstant.columnUuid} ${DBDataType.text},
        ${DBConstant.columnCustomerName} ${DBDataType.text}, 
        ${DBConstant.columnCustomerEmail} ${DBDataType.text},
        ${DBConstant.columnCustomerMobile} ${DBDataType.text},
        ${DBConstant.columnOtp} ${DBDataType.text},
        ${DBConstant.columnExpireAt} ${DBDataType.text},        
        ${DBConstant.columnCustomerProfilePic} ${DBDataType.text},
        ${DBConstant.columnDob} ${DBDataType.text},
        ${DBConstant.columnGender} ${DBDataType.text},
        ${DBConstant.columnToken} ${DBDataType.text},
        ${DBConstant.columnIsMobileVerified} ${DBDataType.text},
        ${DBConstant.columnIsEmailVerified} ${DBDataType.text},
        ${DBConstant.columnIsActive} ${DBDataType.text}, 
        ${DBConstant.columnIsDeleted} ${DBDataType.text},
        ${DBConstant.columnCreatedDate} ${DBDataType.text},
        ${DBConstant.columnUpdatedDate} ${DBDataType.text},
        ${DBConstant.columnDeletedDate} ${DBDataType.text}
        )''');
  }

  Future<bool> isDataBaseHaveData() async {
    if (DBHelper.database != null) {
      List<Map<String, Object?>> listOfData = await DBHelper.database!
          .rawQuery("SELECT * FROM ${DBConstant.tableName}");
      if (listOfData.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  insertTableRow({required Map<String, dynamic> data}) async {
    return await DBHelper.database?.insert(
      DBConstant.tableName,
      data,
    );
  }

  getTableRow() async {
    return await DBHelper.database?.query(DBConstant.tableName,
        where: "${DBConstant.columnId}=?", whereArgs: ['1']);
  }

  Future<String> getParticularData({required String key}) async {
    customer = await DBHelper.dbHelperInstance.getTableRow();
    if (customer.isNotEmpty) {
      if (customer.first[key] != null &&
          customer.first[key].toString().isNotEmpty) {
        return customer.first[key].toString();
      }
    }
    return '';
  }

  Future<String> getToken() async {
    customer = await DBHelper.dbHelperInstance.getTableRow();
    */
/*if (customer.isNotEmpty) {
      if (customer.first[ApiKeyConstants.token] != null &&
          customer.first[ApiKeyConstants.token].toString().isNotEmpty) {
        return customer.first[ApiKeyConstants.token].toString();
      }
    }*//*

    return '';
  }

  Future<String> getCustomerId() async {
    customer = await DBHelper.dbHelperInstance.getTableRow();
    */
/*if (customer.isNotEmpty) {
      if (customer.first[ApiKeyConstants.customerId] != null &&
          customer.first[ApiKeyConstants.customerId].toString().isNotEmpty) {
        return customer.first[ApiKeyConstants.customerId].toString();
      }
    }*//*

    return '';
  }

  updateTableRow({required Map<String, dynamic> userData}) async {
    return await DBHelper.database?.update(DBConstant.tableName, userData,
        where: "${DBConstant.columnId}=?", whereArgs: ['1']);
  }

  updateTableRowColumn({
    required String columnName,
    String? columnValue,
  }) async {
    return await DBHelper.database?.rawUpdate(
        'UPDATE ${DBConstant.tableName} SET  $columnName = ? WHERE ${DBConstant.columnId} = ?',
        [columnValue, '1']);
  }

  uploadImage(
      {required Database db, required Map<String, dynamic> userData}) async {
    return await db.insert(DBConstant.tableName, userData);
  }

  deleteTableRow(
      {required Database db, required String columnCustomerId}) async {
    return await db.delete(
      DBConstant.tableName,
      where: "${DBConstant.columnCustomerId}=?",
      whereArgs: [columnCustomerId],
    );
  }

  insertTableRowList(
      {required Database db, required Map<String, dynamic> data}) async {
    return await db.insert(
      DBConstant.tableName,
      data,
    );
  }

  getList({required Database db}) async {
    return await db.query(
      DBConstant.tableName,
    );
  }
}
*/
