import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class MyVehiclesData {
  Crud crud;
  MyVehiclesData(this.crud);
  myVehicles() async {
    print(AppLink.token);
    var response = await crud.getData(
      AppLink.myVehicles,
      {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppLink.token}'
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
