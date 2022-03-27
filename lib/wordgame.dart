import 'package:final_620710686/game_item.dart';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api.dart';
import 'game_data.dart';

class WordGame extends StatefulWidget {
  const WordGame({Key? key}) : super(key: key);

  @override
  State<WordGame> createState() => _WordGameState();
}

class _WordGameState extends State<WordGame> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadGame();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 1,
            itemBuilder: (context, index) => _buildListItem(context),
          ),
          if (_isLoading)
            const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  _loadGame() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var response = await http.get(url, headers: {'id': '620710686'});
    print(response.body);
    setState(() {
      _isLoading = false;
    });
    var json = jsonDecode(response.body);
    var apiResult = Api.fromJson(json);
    setState(() {
      GameData.list = apiResult.data
          .map<GameItem>((item) => GameItem.fromJson(item))
          .toList();

      /*for (var element in apiResult.data) {
        var foodItem = FoodItem.fromJson(element);
        _foodData.add(foodItem);
      }*/
    });
  }
  Widget _buildListItem(BuildContext context) {
    var gameItem = GameData.list[0];

    return Expanded(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(8.0),
        elevation: 5.0,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Column(
          children: [

            Image.network(
              gameItem.imageUrl,
              width: 200.0,
              height: 200.0,

            ),
            Column(
              children: [
                Text(
                  gameItem.choiceList[0],
                  style: TextStyle(fontSize: 30.0,),
                ),
                Text(
                  gameItem.choiceList[1],
                  style: TextStyle(fontSize: 30.0,),
                ),
                Text(
                  gameItem.choiceList[2],
                  style: TextStyle(fontSize: 30.0,),
                ),
                Text(
                  gameItem.choiceList[3],
                  style: TextStyle(fontSize: 30.0,),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}