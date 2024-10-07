class ContacModel {
  String id = "";
  String nombre = "";
  String apellidos = "";
  String email = "";
  String telefonno = "";

  ContacModel(Map json) {
    id = json["_id"];
    nombre = json["_nombre"];
    apellidos = json["_apellidos"];
    email = json["_email"];
    telefonno = json["_telefono"];
  }

  ContacModel.fromValues(String id, String nombre, String apellidos,
      String email, String telefono) {
    this.id = id;
    this.nombre = nombre;
    this.apellidos = apellidos;
    this.email = email;
    this.telefonno = telefono;
  }
}
