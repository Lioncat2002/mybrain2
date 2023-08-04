import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String url;
  const ResultCard({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri _url = Uri.parse(url);
        if (!await launchUrl(_url)) {
          throw Exception("Couldn't launch $url");
        }
      },
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(
                  color: Colors.black, //color of divider
                  height: 1, //height spacing of divider
                  thickness: 1, //thickness of divier line
                  indent: 0, //spacing at the start of divider
                  endIndent: 0, //spacing at the end of divider
                ),
                Text(
                  url,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 80, 80, 80),
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
