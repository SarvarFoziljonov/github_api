import 'package:flutter/material.dart';
import 'package:mygithub/models/user_model.dart';
import 'package:mygithub/services/httpRequest.dart';

class HomePage extends StatefulWidget {

  static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String name, bio, company, location;


  void fetchInfo () {
   Network.GET(Network.apiGit, Network.paramsEmpty()).then((response) => {
     print (response),
     _showResponse (response)
   });

  }

  void _showResponse (String response) {
  User user = Network.parsUser(response);
   setState(() {
     name = user.name;
     bio = user.bio;
     company = user.company;
     location = user.location;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My GitHub", style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(name, style: TextStyle(color: Colors.black, fontSize: 18),),
            SizedBox(height: 10,),
            Text(bio, style: TextStyle(color: Colors.black, fontSize: 18),),
            SizedBox(height: 20,),
            Text(company, style: TextStyle(color: Colors.black, fontSize: 18),),
            SizedBox(height: 20,),
            Text(location, style: TextStyle(color: Colors.black, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
