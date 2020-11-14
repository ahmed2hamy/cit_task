import 'package:cit_task/constants/colors.dart';
import 'package:cit_task/view/widgets/accounts_card.dart';
import 'package:cit_task/view/widgets/flexible_space_widget.dart';
import 'package:cit_task/view/widgets/popular_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackGroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceWidget(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  AccountsCard(),
                  PopularCard(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
