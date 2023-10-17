enum FromWho { me, hers }

//Se podria añadir atributos como la fecha, si fue visto o no, etc

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}
