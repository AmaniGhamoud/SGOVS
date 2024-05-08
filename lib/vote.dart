import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ParticipantVotesPage(),
    );
  }
}

class ParticipantVotesPage extends StatefulWidget {
  @override
  _ParticipantVotesPageState createState() => _ParticipantVotesPageState();
}

class _ParticipantVotesPageState extends State<ParticipantVotesPage> {
  List<Map<String, dynamic>> _votes = [];

  @override
  void initState() {
    super.initState();
    _fetchVotes();
  }

  Future<void> _fetchVotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('participant_id') ??
        0; // Retrieve user ID from shared preferences

    final response = await http.post(
      Uri.parse(
          'http://regestrationrenion.atwebpages.com/participant_votes.php'),
      body: {'user_id': userId.toString()},
    );

    if (response.statusCode == 200) {
      setState(() {
        _votes = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      });
    } else {
      print('Failed to fetch votes: ${response.statusCode}');
    }
  }

  Future<void> _submitVote(String voteId, String optionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('participant_id') ??
        0; // Retrieve user ID from shared preferences

    final response = await http.post(
      Uri.parse('http://regestrationrenion.atwebpages.com/submit_vote.php'),
      body: {
        'user_id': userId.toString(),
        'vote_id': voteId,
        'option_id': optionId,
      },
    );

    if (response.statusCode == 200) {
      await _fetchVotes();
    } else {
      print('Failed to submit vote: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/4.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _votes.length,
                  itemBuilder: (context, index) {
                    final vote = _votes[index];
                    final List<dynamic> options = vote['options'];

                    return Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(28, 120, 117, 0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/images/pu2.png')),
                              Text(
                                ' ${vote['title']}',
                                style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 160,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Image.asset('assets/images/sonda.png'),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(28, 120, 117, 0.4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 160,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                            'assets/images/clo.png')),
                                    Text(
                                      "Le dernier délai",
                                      style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${vote['closing_date']}",
                                      style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(28, 120, 117, 0.4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' ${vote['description']}',
                            style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: options.map<Widget>((option) {
                              if (option is String) {
                                return Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.5,
                                      child: Radio(
                                        value: option,
                                        groupValue: vote['selected_option'],
                                        onChanged: (value) {
                                          setState(() {
                                            vote['selected_option'] = value;
                                          });
                                        },
                                        activeColor: Color.fromRGBO(28, 120, 117,
                                            1), // Change this to your desired color
                                      ),
                                    ),
                                    Text(
                                      option,
                                      style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              } else if (option is Map) {
                                final optionValue = option['value'];
                                return Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.5,
                                      child: Radio(
                                        value: optionValue,
                                        groupValue: vote['selected_option'],
                                        onChanged: (value) {
                                          setState(() {
                                            vote['selected_option'] = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      optionValue,
                                      style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            }).toList(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(250, 166, 66, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.65,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (vote['selected_option'] != null) {
                                  _submitVote(
                                      vote['id'], vote['selected_option']);
                                } else {
                                  print('Please select an option');
                                }
                              },
                              child: Text(
                                'Voter',
                                style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
