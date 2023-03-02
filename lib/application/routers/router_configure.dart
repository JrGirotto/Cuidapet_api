// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banhopet_api/modules/user/user_router.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:banhopet_api/application/routers/i_router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouter> _routers =[
    UserRouter(),
  ];

  RouterConfigure(this._router);

  void configure() => _routers.forEach((r) => r.configure(_router));
}
