import 'package:cat_trivia/common/app_colors.dart';
import 'package:cat_trivia/common/app_text_styles.dart';
import 'package:cat_trivia/feature/presentation/widgets/facts_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        centerTitle: true,
        title: Text('Cat Trivia',
            style: TextStyle(
                color: Colors.black87.withOpacity(0.8), fontSize: 20)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.history_outlined,
                color: Colors.black87,
                size: 30,
                semanticLabel: 'Fact history',
              )), //button facts history
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(top: 12, bottom: 10),
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(14)),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...factsCard('Awesome fact: ',
                      'The first cat in spac France blasted the cat iqwedqwctrodes implanted in her brains sent neurological signals back to Earth. She survived the trip'),
                  ...factsCard("Created at:", DateFormat('yMMMMd').format(now)),
                ],
              ),
            ),
            //random cat https://cataas.com/cat
            Container(
              height: 400,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage('https://cataas.com/cat'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColors.appBar.withOpacity(0.5),
                    content: const Text(
                      'Updating cat\'s photo and fact... :)',
                      style: TextStyle(color: Colors.black87),
                    )));
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.appBar,
                      border: Border.all(width: 1.7, color: Colors.black38),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Another fact',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 24,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
