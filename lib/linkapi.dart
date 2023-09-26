class AppLink {
  static const String server = "http://taskflutter.futurecode-projects.com/api";
  static const String imagesServer =
      "http://taskflutter.futurecode-projects.com/storage/";
//================================================================
  static String token = '';
  static const String myVehicles = "$server/Vehicle";
  static const String vehicleType = "$server/VehicleType";
  static const String addVehicle = "$server/Vehicle";
  // ================================= Auth ========================== //
  static const String signUp = "$server/register";
  static const String login = "$server/login";
  static const String checkCode = "$server/client/checkCode";
}
