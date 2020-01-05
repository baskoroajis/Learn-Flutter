import 'package:flutter/material.dart';

class RatingBox extends StatefulWidget{
  @override
  _RatingboxState createState() => _RatingboxState();
}

class _RatingboxState extends State<RatingBox>{

  int _rating = 0;

  void setRatingasOne(){
    setState(() {
      _rating = 1;
    });
  }

  void setRatingasTwo(){
    setState(() {
      _rating = 2;
    });
  }

  void setRatingasThree(){
    setState(() {
      _rating = 3;
    });
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    double _size = 20;
    print("rating "+ _rating.toString());

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (
                  _rating>= 1 ? Icon(Icons.star, size: _size,): Icon(Icons.star_border, size: _size,)
              ),
              onPressed: setRatingasOne,
              color: Colors.red[500],
              iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating>= 2 ? Icon(Icons.star, size: _size,): Icon(Icons.star_border, size: _size,)
            ),
            onPressed: setRatingasTwo,
            color: Colors.red[500],
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating>= 3 ? Icon(Icons.star, size: _size,): Icon(Icons.star_border, size: _size,)
            ),
            onPressed: setRatingasThree,
            color: Colors.red[500],
            iconSize: _size,
          ),
        )
      ],
    );
  }

}