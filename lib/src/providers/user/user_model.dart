class UserModel {
  final String address;
  final String birthDate;
  final String birthPlace;
  final String contactNumber;
  final List<DocRequirement> docRequirements;
  final String email;
  final String firstName;
  final String lastName;
  final String idUrl;
  final List<DocRequirement> userAcc;
  final String username;
  final String profileUrl;
  final String registrationDate;
  final String userId;
  final String userRole;

  UserModel({
    required this.address,
    required this.birthDate,
    required this.birthPlace,
    required this.contactNumber,
    required this.docRequirements,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.idUrl,
    required this.userAcc,
    required this.username,
    required this.profileUrl,
    required this.registrationDate,
    required this.userId,
    required this.userRole,
  });
}

class DocRequirement {
  DocRequirement();
}
