import 'package:cit_task/constants/colors.dart';
import 'package:cit_task/constants/images.dart';
import 'package:cit_task/constants/text_styles.dart';
import 'package:cit_task/model/service_model.dart';
import 'package:cit_task/view/widgets/sliver_title.dart';
import 'package:flutter/material.dart';

class FlexibleSpaceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(kBackgroundImage, fit: BoxFit.cover),
        SliverTitle(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleSection(),
                _totalBalance(),
                ServicesListWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget _titleSection() {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 15, top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: kBackGroundColor,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, Mike!", style: kTitleTextStyle),
                Text("Welcome to Lifestyle", style: kSubtitleTextStyle),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget _totalBalance() {
  return Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total Balance", style: kSubtitleTextStyle),
        Text("NGN 12K", style: kTitleTextStyle.copyWith(fontSize: 30)),
      ],
    ),
  );
}

class ServicesListWidget extends StatefulWidget {
  @override
  _ServicesListWidgetState createState() => _ServicesListWidgetState();
}

class _ServicesListWidgetState extends State<ServicesListWidget> {
  List<ServiceModel> _services = [
    ServiceModel(),
    ServiceModel(),
    ServiceModel(),
    ServiceModel(),
    ServiceModel(),
    ServiceModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: LimitedBox(
        maxHeight: 30,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _services.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ChoiceChip(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _services[index].name + "${index + 1}",
                      style: kBlackSubtitleTextStyle,
                    ),
                  ),
                  selected: _services[index].isSelected,
                  onSelected: (_) {
                    for (ServiceModel service in _services) {
                      if (service.isSelected) {
                        setState(() {
                          service.isSelected = false;
                        });
                      }
                    }
                    setState(() {
                      _services[index].isSelected =
                          !_services[index].isSelected;
                    });
                  },
                ),
              );
            }),
      ),
    );
  }
}
