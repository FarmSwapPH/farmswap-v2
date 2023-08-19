class UserData {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final Gender gender;
  final String phone;
  final bool isFarmer;
  final bool isAdmin;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.isFarmer,
    required this.isAdmin,
  });
}

enum Gender { FEMALE, GENDERQUEER, MALE, NON_BINARY }
