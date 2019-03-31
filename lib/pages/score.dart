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

  void _incrementScoreFive() {
    setState(() {
      _score+=5;
    });
  }

  void _decrementScore() {
    if (_score > 0) {
      setState(() {
        _score--;
      });
    }
  }

  void _decrementScoreFive() {
    if (_score > 5) {
      setState(() {
        _score-=5;
      });
    }
    else {
      setState(() {
        _score = 0;
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

    return Scaffold (
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh, color: Colors.white,),
              onPressed: _resetScore),
          IconButton(
              icon: Icon(Icons.edit, color: Colors.white,),
              onPressed: _editScoreDialog),
        ],
      ),
        body: Container(
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
                  child: IconButton(
                      icon: Icon(Icons.looks_5), //TODO: make or find icons for these
                      iconSize: 100.0,
                      onPressed: null),
                  onPressed: _decrementScoreFive,
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: IconButton(
                      icon: Icon(Icons.looks_5), iconSize: 100.0, onPressed: null),
                  onPressed: _incrementScoreFive,
                ),
              )
            ],
          ),
        ),
      ],
    )
//      ),
        )
    );
  }
}
