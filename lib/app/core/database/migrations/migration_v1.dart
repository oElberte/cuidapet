import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE address (
        id Integer primary key autoincrement,
        address text not null,
        lat text,
        lng text,
        additional text
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
