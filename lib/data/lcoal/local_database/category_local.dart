import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/data/model/category_model/category_model.dart';
import 'package:todo_app/data/model/category_model/catigory_constans.dart';
import 'package:todo_app/screens/global.dart';

class CategoryDatabase{
  static final cateDataBase = CategoryDatabase._();

  CategoryDatabase._();

  factory CategoryDatabase(){
    return cateDataBase;
  }

  Database? database1;

  Future<Database> get databases async{
    if(database1 != null){
      return database1!;
    }
    else{
      database1 =  await _init("category.db");
      return database1!;
    }
  }

  Future<Database> _init(String databaseName)async{
    String getPath  = await getDatabasesPath();
    String path = join(databaseName , getPath);
    return await openDatabase(
      getPath,
      version: 1,
      onCreate: onCreate
    );
  }

  Future<void> onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''CREATE TABLE ${CategoryConstants.tableName} (
      ${CategoryConstants.icon} $textType,
      ${CategoryConstants.category} $textType,
      ${CategoryConstants.color} $intType
    )''');
  }

  static Future<void> insertCategory(CategoryModel categoryModel) async {
    final db = await cateDataBase.database1;
    if(db != null){
      int savedTaskID = await db.insert(CategoryConstants.tableName, categoryModel.toJson());
      print("Saqlandi $savedTaskID");
    }
    else{
      print("Null qaytti uka ");
    }

  }

}