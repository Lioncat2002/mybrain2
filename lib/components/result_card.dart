import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Toiger",
                style: TextStyle(fontSize: 20),
              ),
              Divider(
                color: Colors.black, //color of divider
                height: 1, //height spacing of divider
                thickness: 1, //thickness of divier line
                indent: 0, //spacing at the start of divider
                endIndent: 0, //spacing at the end of divider
              ),
              Text(
                "Lorem ipsum dolor set amet",
                style: TextStyle(
                  color: Color.fromARGB(255, 80, 80, 80),
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
