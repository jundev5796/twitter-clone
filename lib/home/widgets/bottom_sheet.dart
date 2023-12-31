import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/home/widgets/bottom_sheet_report.dart';

class BottomSheetModal extends StatefulWidget {
  const BottomSheetModal({super.key});

  @override
  State<BottomSheetModal> createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> {
  void _onReportTap(BuildContext modalContext, BuildContext parentContext) {
    Navigator.pop(modalContext);
    Future.delayed(const Duration(milliseconds: 300), () {
      showModalBottomSheet(
        context: parentContext,
        builder: (context) => const ReportModal(),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white, // You need to specify a color here.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Sizes.size20,
          ),
          topRight: Radius.circular(
            Sizes.size20,
          ),
        ),
      ),
      child: Column(
        children: [
          Gaps.v10,
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 50.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size12,
              horizontal: Sizes.size20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Unfollow",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        "Mute",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size12,
              horizontal: Sizes.size20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        "Hide",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () => _onReportTap(
                        context,
                        Navigator.of(context).context,
                      ),
                      child: const ListTile(
                        title: Text(
                          "Report",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: Sizes.size16 + Sizes.size1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
