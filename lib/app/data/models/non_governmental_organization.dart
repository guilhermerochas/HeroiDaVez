import 'package:objectbox/objectbox.dart';

@Entity()
class NonGovernamentalOrganization {
  int id;
  String nome = '';

  NonGovernamentalOrganization({required this.nome, this.id = 0});
}
