import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  signupData(String name, String phone, String password, image) async {
    var response = await crud.postFileAndData(
        AppLink.signUp,
        {
          'fullname': name.toString(),
          'phone_number': phone.toString(),
          'password': password.toString(),
          'password_confirmation': password.toString(),
        }, {
        'Accept': 'application/json',
      },
        image);
    return response.fold((l) => l, (r) => r);
  }
}
