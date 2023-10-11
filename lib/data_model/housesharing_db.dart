/// The data associated with users.
class HouseData {
  HouseData(
      {required this.item_id,
        required this.location,
        required this.rent,
        required this.imagePath,
        required this.student_id,});

  String item_id;
  String location;
  String rent;
  String imagePath;
  String student_id;
}

class HouseDB {
  final List<HouseData> _rooms = [
    HouseData(
        item_id: 'room-001',
        location: '1711 East West Road',
        rent: '\$300/month',
        imagePath: 'https://static.independent.co.uk/2021/07/27/08/20165319-4a072180-9f19-4240-8ff1-e94279ffcace.jpg?quality=75&width=990&crop=3%3A2%2Csmart&auto=webp',
        student_id: 'user-001'),
    HouseData(
        item_id: 'room-002',
        location: '1234 Dole Street',
        rent: '\$400/month',
        imagePath: 'https://media.istockphoto.com/id/1280875183/photo/general-view-of-an-empty-bedroom-in-a-one-room-apartment.jpg?s=612x612&w=0&k=20&c=UIv8aHEcVcCED5NTxCxcH6EXR4-lIh8aq5oGc6_mV_w=',
        student_id: 'user-002'),
    HouseData(
        item_id: 'room-003',
        location: '1000 Pope Road',
        rent: '\$400/month',
        imagePath: 'https://media.istockphoto.com/id/1280875183/photo/general-view-of-an-empty-bedroom-in-a-one-room-apartment.jpg?s=612x612&w=0&k=20&c=UIv8aHEcVcCED5NTxCxcH6EXR4-lIh8aq5oGc6_mV_w=',
        student_id: 'user-003'),
  ];
  List<HouseData> get rooms => _rooms;
}
/// The singleton instance providing access to all user data for clients.
HouseDB houseDB = HouseDB();