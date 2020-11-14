import 'package:cit_task/constants/colors.dart';
import 'package:cit_task/constants/text_styles.dart';
import 'package:cit_task/model/activities_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class AccountsCard extends StatefulWidget {
  @override
  _AccountsCardState createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  final List<ActivitiesModel> _activities = [
    ActivitiesModel(activityName: "Order Food", activityIcon: Icons.fastfood),
    ActivitiesModel(
        activityName: "Book a Movie", activityIcon: Icons.local_movies),
    ActivitiesModel(
        activityName: "Book an Event", activityIcon: Icons.calendar_today),
    ActivitiesModel(activityName: "History", activityIcon: Icons.history),
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      height: 350,
      alignment: Alignment.center,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Accounts", style: kBlackSubtitleTextStyle),
                  IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
                ],
              ),
              _pageView(),
              Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _currentPage.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: kPrimaryColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageView() {
    return Expanded(
      child: PageView(
        children: [
          _page(),
          _page(),
          _page(),
        ],
        scrollDirection: Axis.horizontal,
        onPageChanged: (page) {
          if (_currentPage != page) {
            setState(() {
              _currentPage = page;
            });
          }
        },
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Current Account", style: kBlackSubtitleTextStyle),
          Text("NGN 2,589,00", style: kBlackTitleTextStyle),
          SizedBox(height: 20),
          Text("********2781",
              style: kBlackSubtitleTextStyle.copyWith(letterSpacing: 5)),
          SizedBox(height: 20),
          _activitiesRow(),
        ],
      ),
    );
  }

  Widget _activitiesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _activities
          .map(
            (a) => _activitiesItemBuilder(
              activityName: a.activityName,
              activityIcon: a.activityIcon,
            ),
          )
          .toList(),
    );
  }

  Widget _activitiesItemBuilder({String activityName, IconData activityIcon}) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: 0,
          child: RaisedButton(
            onPressed: () {},
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(activityIcon, color: kPrimaryColor),
          ),
        ),
        SizedBox(height: 10),
        Text(activityName,
            style: kBlackSubtitleTextStyle.copyWith(fontSize: 12)),
      ],
    );
  }
}
