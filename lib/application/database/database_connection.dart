// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:banhopet_api/application/config/database_connection_configuration.dart';
import 'package:banhopet_api/application/database/i_database_connection.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

@LazySingleton(as: IDatabaseConnection)
class DatabaseConnection implements IDatabaseConnection {
final DatabaseConnectionConfiguration _configuration;
  
  DatabaseConnection(this._configuration);

  @override
  Future<MySqlConnection> openConnection() {
    return MySqlConnection.connect(ConnectionSettings(
      host: _configuration.host,
      port: _configuration.port,
      user: _configuration.user,
      password: _configuration.password,
      db: _configuration.databaseName,
    ));
  }

   
}
