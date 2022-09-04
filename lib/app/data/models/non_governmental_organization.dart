import 'package:objectbox/objectbox.dart';

@Entity()
class NonGovernamentalOrganization {
  int id;
  String name;
  String loginCode;
  String email;
  int? phoneNumber;

  NonGovernamentalOrganization({
    required this.name,
    this.id = 0,
    required this.loginCode,
    required this.email,
    this.phoneNumber,
  });
}
