import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: Movie(),
  ));
}

class MyApp extends StatelessWidget {
  final Movie model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<Movie>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieStore',
        home: Listscreen(),
      ),
    );
  }
}

class Listscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[300],
        title: Text('Movie Store'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<Movie>(
                builder: (context, child, model) {
              return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(itemList[index].image)),
                  title: Text(itemList[index].title),
                  subtitle: Text('\฿' + itemList[index].price.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    model.addMovie(itemList[index]);
                    print('Add: ' + itemList[index].title);
                    print(model.calculateTotal());
                  });
            });
          }),
    );
  }
}

class Movies {
  int price;
  int id;
  String title;
  String image;
  Movies(
      {@required this.price,
      @required this.id,
      @required this.title,
      @required this.image});
}

List<Movies> itemList = [
  Movies(
      id: 1,
      title: 'Ironman 1',
      image: 'assets/images/IronMan1.jpg',
      price: 129),
  Movies(
      id: 2,
      title: 'Ironman 2',
      image: 'assets/images/IronMan2.jpg',
      price: 129),
  Movies(
      id: 3,
      title: 'Ironman 3',
      image: 'assets/images/IronMan3.jpg',
      price: 129),
  Movies(
      id: 4,
      title: 'Captain America The First Avenger',
      image: 'assets/images/captain1.jpg',
      price: 129),
  Movies(
      id: 5,
      title: 'Captain America The Winter Soldier',
      image: 'assets/images/captain2.jpg',
      price: 129),
  Movies(
      id: 6,
      title: 'Captain America Civil War',
      image: 'assets/images/captain3.jpg',
      price: 129),
  Movies(
      id: 7,
      title: 'The Avengers',
      image: 'assets/images/avengers1.jpg',
      price: 129),
  Movies(
      id: 8,
      title: 'Avengers Age of Ultron',
      image: 'assets/images/avengers2.jpg',
      price: 129),
  Movies(
      id: 9,
      title: 'Avengers Infinity War',
      image: 'assets/images/avengers3.jpg',
      price: 129),
  Movies(
      id: 10,
      title: 'Avengers Endgame',
      image: 'assets/images/avengers4.jpg',
      price: 129),
];
