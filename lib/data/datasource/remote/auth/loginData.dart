import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  loginData(String phone, String password) async {
    var response = await crud.postData(
      AppLink.login,
      {
        'phone_number': phone.toString(),
        'password': password.toString(),
      },
      {
        'Accept': 'application/json',
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
