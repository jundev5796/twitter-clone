import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

const interests = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation & comics",
  "Buriness & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Daily ㅣife",
  "Comedy",
  "Animals",
  "Beauty & style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Fitness & Health",
  "Dance",
  "Art",
  "Shopping",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Color(0xFF4E98E9),
          size: Sizes.size20 + 10,
        ),
        leadingWidth: 100,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
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
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Sizes.size16 + 2,
                ),
              ),
              Gaps.v64,
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  for (var interest in interests)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedInterests.contains(interest)) {
                            _selectedInterests.remove(interest);
                          } else if (_selectedInterests.length < 3) {
                            _selectedInterests.add(interest);
                          }
                        });
                      },
                      child: Container(
                        width: 170,
                        height: 75,
                        decoration: BoxDecoration(
                          color: _selectedInterests.contains(interest)
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(
                            (Sizes.size16),
                          ),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: Sizes
                                      .size12, // Adjust this padding to control vertical distance from the bottom
                                  left: Sizes
                                      .size12, // Adjust this padding to control horizontal distance from the left
                                ),
                                child: Text(
                                  interest,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: _selectedInterests.contains(interest)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top:
                                  8, // Adjust this value for vertical positioning
                              right:
                                  8, // Adjust this value for horizontal positioning
                              child: _selectedInterests.contains(interest)
                                  ? const FaIcon(
                                      FontAwesomeIcons
                                          .checkCircle, // Corrected the icon reference
                                      color: Colors.white,
                                      size: 20, // Adjust the size as needed
                                    )
                                  : Container(), // Use an empty Container for interests not selected
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 40,
            right: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_selectedInterests.length} of 3 selected',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
              GestureDetector(
                onTap: _selectedInterests.length == 3
                    ? () {
                        // Place your "Next" action logic here
                      }
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _selectedInterests.length == 3
                        ? const Color(0xFF101318)
                        : Colors.grey,
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: _selectedInterests.length == 3
                          ? Colors.white
                          : const Color.fromARGB(255, 229, 226, 226),
                      fontSize: Sizes.size16 + 2,
                    ),
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
