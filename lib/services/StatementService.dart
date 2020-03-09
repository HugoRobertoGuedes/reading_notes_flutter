import 'package:lg_movel/models/statement.dart';
import 'package:lg_movel/services/ClienteService.dart';

/* *
 * * Registrar Statement
 */
Future<bool> sendStatemnet(Verb verb, Object object) async {
  Actor actor = new Actor(objectType: 'Agent', name: 'Teste Name', mbox: 'teste@mail.com');
  Statement statement = new Statement(actor: actor, verb: verb, object: object);
  await autenticate();
  var respose = await post('/Statement', statement.toJson(), true);
  if(respose.statusCode == 200)
    return true;
  else
    return false;
}