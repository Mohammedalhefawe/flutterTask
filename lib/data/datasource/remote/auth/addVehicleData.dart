import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class AddVehicleData {
  Crud crud;
  AddVehicleData(this.crud);
  typesVehiclesData() async {
    var response = await crud.getData(
      AppLink.vehicleType,
      {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppLink.token}'
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  addVehicleData(typeId, numberVehicle, model, color, images) async {
    var response = await crud.postMutipleImagesAndData(
        AppLink.addVehicle,
        {
          'vehicle_type_id': typeId,
          'board_number': numberVehicle,
          'model': model,
          'color': color
        },
        {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${AppLink.token}'
        },
        images,
        [
          'vehicle_image',
          'board_image',
          'id_image',
          'mechanic_image',
          'delegate_image'
        ]);
    return response.fold((l) => l, (r) => r);
  }
}
