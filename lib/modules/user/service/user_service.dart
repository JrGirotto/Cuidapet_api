// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banhopet_api/entities/user.dart';
import 'package:banhopet_api/modules/user/data/i_user_repository.dart';
import 'package:banhopet_api/modules/user/view_modules/user_save_input_model.dart';
import 'package:injectable/injectable.dart';

import './i_user_service.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  IUserRepository userRepository;
  UserService({
    required this.userRepository,
  });

  @override
  Future<User> createUser(UserSaveInputModel user) {
    final userEntity = User(
        email: user.email,
        password: user.password,
        registerType: 'App',
        supplierId: user.supplierId);

    return userRepository.createUser(userEntity);
  }
}
