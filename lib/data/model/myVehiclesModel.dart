class Vehicle {
  int id;
  int vehicleTypeId;
  int userId;
  String model;
  String color;
  int boardNumber;
  String vehicleImage;
  String mechanicImage;
  String boardImage;
  String idImage;
  String delegateImage;
  VehicleType type;

  Vehicle({
    required this.id,
    required this.vehicleTypeId,
    required this.userId,
    required this.model,
    required this.color,
    required this.boardNumber,
    required this.vehicleImage,
    required this.mechanicImage,
    required this.boardImage,
    required this.idImage,
    required this.delegateImage,
    required this.type,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      vehicleTypeId: json['vehicle_type_id'],
      userId: json['user_id'],
      model: json['model'],
      color: json['color'],
      boardNumber: json['board_number'],
      vehicleImage: json['vehicle_image'],
      mechanicImage: json['mechanic_image'],
      boardImage: json['board_image'],
      idImage: json['id_image'],
      delegateImage: json['delegate_image'],
      type: VehicleType.fromJson(json['type']),
    );
  }
}

class VehicleType {
  int id;
  String name;

  VehicleType({
    required this.id,
    required this.name,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'],
      name: json['name'],
    );
  }
}
