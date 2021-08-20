import 'package:chanshare/browse.dart';
import 'package:flutter/material.dart';

class InitializeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _threadIdTextController = TextEditingController();
  final _boardNameTextController = TextEditingController();

  void _showBrowseScreen() {
    //Navigator.of(context).pushNamed('/welcome');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BrowseScreen(board: _boardNameTextController.text, threadNo: int.parse(_threadIdTextController.text)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Browse a thread', style: Theme
              .of(context)
              .textTheme
              .headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _threadIdTextController,
              decoration: InputDecoration(hintText: 'Thread ID'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _boardNameTextController,
              decoration: InputDecoration(hintText: 'Board shortname'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(200, 50)),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
              foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.blue;
              }),
            ),
            onPressed: _showBrowseScreen,
            child: Text('Start'),
          ),
          Padding(padding: EdgeInsets.all(3.0)),
        ],
      ),
    );
  }
}
