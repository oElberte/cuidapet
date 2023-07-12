import 'migrations/migration.dart';
import 'migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migration> getUpdateMigrations(int version) {
    // if (version == 2) {
    //   return [
    //     MigrationV1(),
    //     MigrationV2(),
    //   ];
    // } else if (version == 3) {
    //   return [
    //     MigrationV1(),
    //     MigrationV2(),
    //     MigrationV3(),
    //   ];
    // }

    return [];
  }
}
