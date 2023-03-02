import 'package:banhopet_api/entities/user.dart';

abstract class IUserRepository {
  Future<User> createUser(User user);
}
