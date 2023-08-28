import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/home_screen.dart';

const musics = [
  "Rap",
  "R&B & soul",
  "Grammy Awards",
  "Pop",
  "K-pop",
  "Music industry",
  "EDM",
  "Music news",
  "Hip hop",
  "Reggae",
  "Rock",
  "Jazz",
  "Popular music",
  "Electronic",
  "Classical",
  "Alternative",
];

const entertainments = [
  "Anime",
  "Games",
  "The Game Awards",
  "Ys",
  "Legend of Heroes",
  "Final Fantasy",
  "Spider-Man",
  "One Piece",
  "Oshi no Ko",
  "Movies & TV",
  "Harry Potter",
  "Marvel",
  "Movie news",
  "Movies",
  "Grammy Awards",
];

class InterestsScreenTwo extends StatefulWidget {
  const InterestsScreenTwo({super.key});

  @override
  State<InterestsScreenTwo> createState() => _InterestsScreenTwoState();
}

class _InterestsScreenTwoState extends State<InterestsScreenTwo> {
  final Set<String> _selected = {};
  final List<String> _selectedInterests = [];

  void onInitialTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  List<List<T>> chunk<T>(List<T> list, int size) {
    var chunks = <List<T>>[];
    for (var i = 0; i < list.length; i += size) {
      chunks.add(
          list.sublist(i, i + size > list.length ? list.length : i + size));
    }
    return chunks;
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double chipWidth = 100.0;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Color(0xFF4E98E9),
          size: Sizes.size20 + 10,
        ),
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () => onInitialTap(context),
          icon: const Padding(
            padding:
                EdgeInsets.only(right: 40), // Adjust this value to your needs
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Color(0xFF101318),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              const Text(
                "What do you want to see on Twitter",
                style: TextStyle(
                  fontSize: Sizes.size28 + 2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v24,
              Text(
                "Interests are used to personalize your experience and will be visible on your profile.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Sizes.size16 + 2,
                ),
              ),
              Gaps.v40,
              const Text(
                'Music',
                style: TextStyle(
                  fontSize: Sizes.size20 + 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v28,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: chunk(musics, (musics.length / 3).ceil())
                          .map((musicChunk) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: Sizes.size10),
                          child: Row(
                            children: musicChunk.map((music) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: Sizes.size10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_selected.contains(music)) {
                                        _selected.remove(music);
                                      } else {
                                        _selected.add(music);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size14,
                                      horizontal: Sizes.size24 + 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _selected.contains(music)
                                          ? Colors.blue // Color when selected
                                          : Colors
                                              .transparent, // Original color
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: Text(
                                      music,
                                      style: TextStyle(
                                        color: _selected.contains(music)
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: Sizes.size16,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const Text(
                'Entertainment',
                style: TextStyle(
                  fontSize: Sizes.size20 + 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v28,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: chunk(entertainments,
                              (entertainments.length / 3).ceil())
                          .map((entertainmentChunk) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: Sizes.size10),
                          child: Row(
                            children: entertainmentChunk.map((entertainment) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: Sizes.size10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_selected.contains(entertainment)) {
                                        _selected.remove(entertainment);
                                      } else {
                                        _selected.add(entertainment);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size14,
                                      horizontal: Sizes.size24 + 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _selected.contains(entertainment)
                                          ? Colors.blue // Color when selected
                                          : Colors
                                              .transparent, // Original color
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: Text(
                                      entertainment,
                                      style: TextStyle(
                                        color: _selected.contains(entertainment)
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: Sizes.size16,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 40,
            right: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _selected.length >= 3 ? _onNextTap : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey; // Color for disabled state
                      }
                      return const Color(0xFF101318); // Color for enabled state
                    },
                  ),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size20,
                  )),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: _selected.length >= 3
                        ? Colors.white
                        : const Color.fromARGB(255, 229, 226, 226),
                    fontSize: Sizes.size16 + 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
