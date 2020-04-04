import 'package:flutter/material.dart';
import 'package:flutteramazingiamges/mvp/base_state.dart';
import 'package:flutteramazingiamges/mvp/presenters/second_page_presenter.dart';
import 'package:flutteramazingiamges/provider/index.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends BaseState<SecondPage, SecondPagePresenter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              '${provider.counterValue}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          presenter.incrementCounter();
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void setCounter() {
    final provider = Provider.of<CounterProvider>(context, listen: false);
    provider.incrementCounter();
  }

  @override
  SecondPagePresenter createPresenter() {
    return SecondPagePresenter();
  }
}
