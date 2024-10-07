import 'package:ejemplo5/models/contacModel.dart';

class ContactResponseModel {
  List<ContacModel> listaContactos = <ContacModel>[];

  ContactResponseModel.empty() {
    this.listaContactos = List.empty();
  }

  ContactResponseModel.fromDB(List<Map> resultadosQuery) {
    for (int i = 0; i < resultadosQuery.length; i++) {
      ContacModel contacto = ContacModel(resultadosQuery[i]);
      this.listaContactos.add(contacto);
    }
  }
}
