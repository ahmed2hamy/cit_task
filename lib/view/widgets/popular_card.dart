import 'package:cit_task/constants/colors.dart';
import 'package:cit_task/constants/images.dart';
import 'package:cit_task/constants/text_styles.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PopularCard extends StatefulWidget {
  @override
  _PopularCardState createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      height: 320,
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
              _titleRow(),
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

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Most Popular", style: kBlackSubtitleTextStyle),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
      ],
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _restaurantImage(),
          SizedBox(width: 15),
          _restaurantDetails(),
        ],
      ),
    );
  }

  Widget _restaurantImage() {
    return Container(
      width: 120,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(kBbqImage), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
      // child:,
    );
  }

  Widget _restaurantDetails() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Restaurant Name",
                style: kBlackSubtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              SmoothStarRating(
                isReadOnly: true,
                color: Colors.yellow,
                borderColor: Colors.yellow,
                rating: 4,
                starCount: 5,
                size: 10,
              ),
            ],
          ),
          Text("Beef BBQ", style: kBlackTitleTextStyle),
          Text(
            "Lorem Ipsum is simply dummy "
            "text of the printing and typesetting industry."
            " Lorem Ipsum has been the industry's standard dumm",
            style: kBlackSubtitleTextStyle.copyWith(fontSize: 12),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                "Quantity: ",
                style: kBlackTitleTextStyle.copyWith(fontSize: 20),
              ),
              Text(
                "1",
                style: kBlackTitleTextStyle.copyWith(
                  fontSize: 18,
                  color: kPrimaryColor,
                ),
              ),
              ButtonTheme(
                minWidth: 0,
                padding: const EdgeInsets.all(2),
                height: 2,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NGN100",
                style: kBlackTitleTextStyle.copyWith(
                  color: kPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonTheme(
                minWidth: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  onPressed: () {},
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Order now",
                    style: kTitleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
