import 'package:banhopet_api/application/config/database_connection_configuration.dart';
import 'package:banhopet_api/application/database/i_database_connection.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

@LazySingleton(as: IDatabaseConnection)
class DatabaseConnection implements IDatabaseConnection {
  final DatabaseConnectionConfiguration _configuration;

  DatabaseConnection(this._configuration);

  @override
  Future<MySqlConnection> openConnection() async {
    


    var conn =  MySqlConnection.connect(ConnectionSettings(
      host: _configuration.host,
      port: _configuration.port,
      user: _configuration.user,
      password: _configuration.password,
      db: _configuration.databaseName,
    ));
    await Future.delayed(Duration(milliseconds: 2000));
    return conn;
  }
}
