
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  DBhelper._();

  static final DBhelper getinstance = DBhelper._();

  static const String HeathData = "Health";
  static const String COLUMN_DATA_SNO = "s_no";
  static const String COLUMN_DATA_HEARTRATE = "heart_rate";
  static const String COLUMN_DATA_BLOODOXYGENLEVEL = "blood_oxygen_level";
  static const String COLUMN_DATA_BLOODPRESSURE = "blood_Pressure"; // Fixed
  static const String COLUMN_DATA_BLOODGLUCOSELEVEL= "blood_glucose_level"; // Fixed
  static const String COLUMN_DATA_PHYSICALACTIVITY = "physical_activity";
  static const String COLUMN_DATA_SLEEPPATTERNS = "sleep_patterns";
  static const String COLUMN_DATA_STREESMONITORING = "stress_monitoring";

  Database? mydb;

  Future<Database?> getdb() async
  {
    if (mydb != null)
    {
      return mydb;
    } else
    {
      mydb = await opendb();
      return mydb;
    }
  }

  Future<Database?> opendb() async {
    Directory appdir = await getApplicationDocumentsDirectory();
    var dbpath = join(appdir.path, "HealthData.db");

    return await openDatabase(dbpath, onCreate: (db, version) {
      db.execute
        (
          "create table $HeathData("
              "$COLUMN_DATA_SNO integer primary key autoincrement ,"
              " $COLUMN_DATA_BLOODGLUCOSELEVEL integer, "
              "$COLUMN_DATA_BLOODOXYGENLEVEL integer,"
              " $COLUMN_DATA_BLOODPRESSURE integer,"
              " $COLUMN_DATA_HEARTRATE integer, "
              "$COLUMN_DATA_PHYSICALACTIVITY integer,"
              " $COLUMN_DATA_SLEEPPATTERNS integer,"
              " $COLUMN_DATA_STREESMONITORING integer)"
        );
    }, version: 1);
  }

  Future<bool> addNotes({
    required int mheartrate,
    required int mbloodoxygenlvl,
    required int mbloodpressure,
    required int mbloodglucoselvl,
    required int mphysicialavtivity,
    required int msleeppatterns,
    required int mstressmonitoring,
  }) async {
    var db = await getdb();

    int rowsEffected = await db!.insert(HeathData, {
      COLUMN_DATA_HEARTRATE: mheartrate,
      COLUMN_DATA_BLOODOXYGENLEVEL: mbloodoxygenlvl,
      COLUMN_DATA_BLOODGLUCOSELEVEL: mbloodglucoselvl,
      COLUMN_DATA_PHYSICALACTIVITY: mphysicialavtivity,
      COLUMN_DATA_SLEEPPATTERNS: msleeppatterns,
      COLUMN_DATA_STREESMONITORING: mstressmonitoring
    });
    return rowsEffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getdb();
    List<Map<String, dynamic>> mydata = await db!.query(HeathData);
    return mydata;
  }

  Future<bool> updateNote(
      int mheartrate,
      int mbloodoxygenlvl,
      int mbloodpressure,
      int mbloodglucoselvl,
      int mphysicialavtivity,
      int msleeppatterns,
      int mstressmonitoring,
      int sno) async {
    var db = await getdb();
    int rowEffected = await db!.update(
        HeathData,
        {
          COLUMN_DATA_HEARTRATE: mheartrate,
          COLUMN_DATA_BLOODOXYGENLEVEL: mbloodoxygenlvl,
          COLUMN_DATA_BLOODGLUCOSELEVEL: mbloodglucoselvl,
          COLUMN_DATA_PHYSICALACTIVITY: mphysicialavtivity,
          COLUMN_DATA_SLEEPPATTERNS: msleeppatterns,
          COLUMN_DATA_STREESMONITORING: mstressmonitoring
        },
        where: "$COLUMN_DATA_SNO = ?",
        whereArgs: [sno]);

    return rowEffected > 0;
  }

  Future<bool> deleteNote({required int sno}) async {
    var db = await getdb();

    int rowEffected = await db!.delete(HeathData, where: "$COLUMN_DATA_SNO = ?", whereArgs: ["$sno"]);

    return rowEffected > 0;
  }
}
