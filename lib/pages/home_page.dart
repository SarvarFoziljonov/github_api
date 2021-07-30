import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mygithub/models/user_model.dart';
import 'package:mygithub/services/httpRequest.dart';

class HomePage extends StatefulWidget {

  static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String name, bio, company, avatar_url, location;


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
     avatar_url = user.avatar_url;
   });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInfo ();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My GitHub", style: TextStyle(color: Colors.white, fontSize: 18),),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.github,
                  size: 40.0,
                ),
              )
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  // profile photo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child:  Image.network(avatar_url ?? '', width: 90, height: 90, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 30,),
                  Text(name ?? '', style: TextStyle(fontSize: 25, color: Colors.deepPurpleAccent),),
                ],
              ),
              SizedBox(height: 30,),
              Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.github, color: Colors.redAccent,),
                          SizedBox(width: 30,),
                          Text(bio ?? '', style: TextStyle(fontSize: 20, color: Colors.redAccent),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.work, color: Colors.green,),
                          SizedBox(width: 30,),
                          Text(company ?? '', style: TextStyle(fontSize: 20, color: Colors.green),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.location_city, color: Colors.blue,),
                          SizedBox(width: 30,),
                          Text(location ?? '', style: TextStyle(fontSize: 20, color: Colors.blue),)
                        ],
                      ),

                    ],
                  )
              ),
            ],
          )
      ),
    );

  }
}
