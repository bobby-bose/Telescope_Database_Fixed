import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LearningCornerPage extends StatefulWidget {
  const LearningCornerPage({Key? key}) : super(key: key);

  @override
  _LearningCornerPageState createState() => _LearningCornerPageState();
}

class _LearningCornerPageState extends State<LearningCornerPage> {
  late String apodImageUrl = '';
  late String apodTitle = '';
  late String apodExplanation = '';
  bool isLoading = true;
  bool isError = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    fetchAPOD();
  }

  Future<void> fetchAPOD() async {
    final apiKey = 'IBSjVBeOeAj81uRWuZ4xVxj3wPxt2lQcWdm64vDi';
    final url =
        Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          apodImageUrl = jsonData['url'];
          apodTitle = jsonData['title'];
          apodExplanation = jsonData['explanation'];
          isLoading = false;
        });
      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learning Corner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.indigo.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
              ? Center(
                  child: Text('Failed to load data.',
                      style: TextStyle(color: Colors.black87)))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (apodImageUrl.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Picture of the Day',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: NetworkImage(apodImageUrl),
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Center(
                                    child: Text('Failed to load image.'));
                              },
                            ),
                          ),
                        ),
                      ],
                      if (apodTitle.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            apodTitle,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                      if (apodExplanation.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                isExpanded
                                    ? apodExplanation
                                    : apodExplanation.substring(0, 150),
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.black87),
                              ),
                              if (apodExplanation.length > 150)
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Text(
                                    isExpanded ? 'Show less' : 'Show more',
                                    style: TextStyle(
                                        color: Colors.indigo.shade900),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
    );
  }
}
