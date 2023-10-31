import 'package:basketball_counter/cubit/counter.dart';
import 'package:basketball_counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  int teamAScore = 0;
  int teamBScore = 0;

  TextStyle resStyle() => const TextStyle(fontSize: 150);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitCounter, CounterState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: const Text('Points Counter'),
              ),
              body: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Team A',
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              BlocProvider.of<CubitCounter>(context)
                                  .teamACount
                                  .toString(),
                              style: resStyle(),
                            ),
                            const AddPointButton(pointNum: 1, team: 'A'),
                            const SizedBox(height: 15),
                            const AddPointButton(pointNum: 2, team: 'A'),
                            const SizedBox(height: 15),
                            const AddPointButton(pointNum: 3, team: 'A'),
                          ],
                        ),
                        const VerticalDivider(
                          thickness: 1,
                          width: 20,
                          color: Colors.grey,
                          indent: 50,
                          endIndent: 30,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Team B',
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              BlocProvider.of<CubitCounter>(context)
                                  .teamBCount
                                  .toString(),
                              style: resStyle(),
                            ),
                            const AddPointButton(pointNum: 1, team: 'B'),
                            const SizedBox(height: 15),
                            const AddPointButton(pointNum: 2, team: 'B'),
                            const SizedBox(height: 15),
                            const AddPointButton(pointNum: 3, team: 'B'),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CubitCounter>(context).resetPoints();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(150, 40)),
                      child: const Text('Reset'))
                ],
              )),
            ),
        listener: (context, state) {});
  }
}

class AddPointButton extends StatelessWidget {
  const AddPointButton({
    Key? key,
    required this.pointNum,
    required this.team,
  }) : super(key: key);

  final int pointNum;
  final String team;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<CubitCounter>(context)
            .incrementPoint(points: pointNum, team: team);
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          minimumSize: const Size(140, 50)),
      child: Text('Add $pointNum Point'),
    );
  }
}
