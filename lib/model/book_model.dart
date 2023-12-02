class BookModel{
  final int id;
  final String titulo;
  final String autor;
  final String img;
  final String dl;
  bool? fav = false;
  BookModel({required this.id, required this.titulo, required this.autor, required this.img, required this.dl, this.fav});

  void addFav(){
    fav =! fav!;
  }

}