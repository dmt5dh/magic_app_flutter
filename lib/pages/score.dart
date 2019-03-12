import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  @override
  ScorePageState createState() => new ScorePageState();
}

class ScorePageState extends State<ScorePage> {
  final _textStyle = const TextStyle(fontSize: 100.0);

  int _score = 20;

  final _scoreTextFieldController = TextEditingController();

  @override
  void displose() {
    _scoreTextFieldController.dispose();
    super.dispose();
  }

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  void _decrementScore() {
    if (_score > 0) {
      setState(() {
        _score--;
      });
    }
  }

  void _resetScore() {
    setState(() {
      _score = 20;
    });
  }

  void _editScoreDialog() {
    _scoreTextFieldController.text = _score.toString();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Edit Score"),
            content: TextField(
              controller: _scoreTextFieldController,
              style: _textStyle,
              textAlign: TextAlign.center,
              autofocus: true,
              keyboardType: TextInputType.number,
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("Confirm"),
                onPressed: () {
                  setState(() {
                    _score = int.parse(_scoreTextFieldController.text);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
//    scoreTextFieldController.text = _score.toString();

    return Container(
//        margin: EdgeInsets.all(5.0),
//      child: Center(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
              color: Colors.white70,
              alignment: Alignment.center,
              child: InkWell(
                onTap: _editScoreDialog,
                child: Text(
                  _score.toString(),
                  style: _textStyle,
                ),
              )),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 100.0,
                      onPressed: null),
                  onPressed: _decrementScore,
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: IconButton(
                      icon: Icon(Icons.add), iconSize: 100.0, onPressed: null),
                  onPressed: _incrementScore,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: _resetScore,
                child: IconButton(
                    icon: Icon(Icons.refresh),
                    iconSize: 100.0,
                    onPressed: null),
              ),
            )
          ],
        ))
      ],
    )
//      ),
        );
  }
}
