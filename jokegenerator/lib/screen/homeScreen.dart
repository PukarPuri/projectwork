import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jokegenerator/firebaseHelper.dart';
import 'package:jokegenerator/model/jokeModel.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<jokeModel> listJoke=[];
  // int num = 0;
  // int lastRandomNumber = -1;

  // int getRandomJokeIndex() {
  //   Random random = Random();
  //   int newRandomNumber = random.nextInt(listJoke.length);
  //   while (newRandomNumber == lastRandomNumber) {
  //     newRandomNumber = random.nextInt(listJoke.length);
  //   }
  //   lastRandomNumber = newRandomNumber;
  //   return newRandomNumber;
  // }
  void getData()async{
    listJoke=await FirebaseHelper.instance.getApiData();
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Joke App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 15,
              child: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(spreadRadius: 1)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    listJoke[0].title.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'FontMain',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       // Generate a new random number for the next joke
          //       num = getRandomJokeIndex();
          //     });
          //   },
          //   child: Text('Random Joke'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.teal,
          //     fixedSize: Size(200, 50),
          //     foregroundColor: Colors.white,
          //   ),
          // )
        ],
      ),
      drawer: Drawer(),
    );
  }
}

// List<jokeModel> listJoke = [
//   jokeModel(
//     id: '1',
//     joke: "Why don't scientists trust atoms? Because they make up everything!",
//   ),
//   jokeModel(
//     id: '2',
//     joke:
//         "I told my wife she was drawing her eyebrows too high. She looked surprised.",
//   ),
//   jokeModel(
//     id: '3',
//     joke: "Why don't skeletons fight each other? They don't have the guts!",
//   ),
//   jokeModel(
//     id: '4',
//     joke:
//         "Did you hear about the claustrophobic astronaut? He just needed a little space.",
//   ),
//   jokeModel(
//     id: '5',
//     joke: "Why did the bicycle fall over? Because it was two-tired!",
//   ),
// ];

