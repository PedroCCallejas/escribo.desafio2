

import 'package:desafio2/model/book_model.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({Key? key}) : super(key: key);

  List<BookModel> lista = [
    BookModel(
        id: 1,
        titulo: "The Bible of Nature",
        autor: "Oswald, Felix L.",
        img:
            "https://www.gutenberg.org/cache/epub/72134/pg72134.cover.medium.jpg",
        dl: "https://www.gutenberg.org/cache/epub/72134/pg72134.cover.medium.jpg",
        fav: false),
    BookModel(
        id: 2,
        titulo: "Kazan",
        autor: "Curwood, James Oliver",
        img:
            "https://www.gutenberg.org/cache/epub/72127/pg72127.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/72134.epub3.images",
        fav: false),
    BookModel(
        id: 3,
        titulo: "Mythen en sagen uit West-Indië",
        autor: "Cappelle, Herman van, Jr.",
        img:
            "https://www.gutenberg.org/cache/epub/72126/pg72126.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/72126.epub.noimages",
        fav: false),
    BookModel(
        id: 4,
        titulo: "Lupe",
        autor: "Affonso Celso",
        img:
            "https://www.gutenberg.org/cache/epub/63606/pg63606.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/63606.epub3.images",
        fav: false),
    BookModel(
        id: 5,
        titulo: "Nuorta ja vanhaa väkeä: Kokoelma kertoelmia",
        autor: "Fredrik Nycander",
        img:
            "https://www.gutenberg.org/cache/epub/72135/pg72135.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/72135.epub3.images",
        fav: false),
    BookModel(
        id: 6,
        titulo: "Among the Mushrooms: A Guide For Beginners",
        autor: "Burgin and Dallas",
        img:
            "https://www.gutenberg.org/cache/epub/18452/pg18452.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/18452.epub3.images",
        fav: false),
    BookModel(
        id: 7,
        titulo: "The History of England in Three Volumes, Vol.III.",
        autor: "Burgin and Dallas",
        img:
            "https://www.gutenberg.org/cache/epub/19218/pg19218.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/19218.epub3.images",
        fav: false),
    BookModel(
        id: 8,
        titulo: "Adventures of Huckleberry Finn",
        autor: "Mark Twain",
        img: "https://www.gutenberg.org/cache/epub/76/pg76.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/76.epub3.images",
        fav: false),
    BookModel(
        id: 9,
        titulo: "The octopus: or, The 'devil-fish' of fiction and of fact",
        autor: "Henry Lee",
        img:
            "https://www.gutenberg.org/cache/epub/72133/pg72133.cover.medium.jpg",
        dl: "https://www.gutenberg.org/ebooks/72133.epub3.images",
        fav: false),
  ];

  List<BookModel> favoritos = [];


  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('eBooks'),
          bottom: const TabBar(tabs: [
            Tab(
                icon: Icon(
              Icons.book,
            )),
            Tab(
                icon: Icon(
              Icons.star_outlined,
            )),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          //tela 1
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  mainAxisSpacing: 40),
              itemCount: widget.lista.length,
              itemBuilder: (context, index) {
                var item = widget.lista[index];
                return
                  Book(item);
              },
            ),
          ),

          //tela 2
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  mainAxisSpacing: 40),
              itemCount: widget.favoritos.length,
              itemBuilder: (context, index) {
                var item = widget.favoritos[index];

                  return
                    Book(item);

                },
            ),
          ),
        ]),
      ),
    );
  }

  Widget Book(BookModel item) {

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  item.img,
                  width: 50,
                ),
              ),
            ),
            Positioned(
              top: -11,
              right: -11,
              child: IconButton(
                icon: Stack(
                  children: [
                    Icon(
                      Icons.star,
                      color: item.fav == false
                          ? Colors.grey
                          : Colors.amberAccent,
                    ),
                  ],
                ),
                onPressed: () {
                  item.addFav();
                  bool existe = false;

                 widget.favoritos.forEach((element) {
                   if(element.id == item.id){
                     existe = true;

                   }

                 });
                 if(existe){
                   widget.favoritos.removeWhere((element) => element.id == item.id);
                 }else{
                   widget.favoritos.add(item);
                 }

                  setState(() {
                    if (item.fav == true) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Adicionado aos favoritos')));
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Removido dos favoritos')));
                    }
                  });

                },
              ),
            ),
          ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.titulo,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.alphabetic),
                ),
                Text(
                  item.autor,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
