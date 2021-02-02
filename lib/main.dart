import 'package:bloc_pattern_practice/bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => ImageBloc("0"),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _blocImage = BlocProvider.of<ImageBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png",
            width: 250,
            height: 200,
          ),
          BlocBuilder<ImageBloc, String>(
            builder: (BuildContext context, String urlstate) {
              return Image.network(
                urlstate,
                width: 200,
                height: 200,
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Get  Image"),
                color: Colors.blue[700],
                onPressed: () {
                  _blocImage.add(ImageEvent.getImage);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
