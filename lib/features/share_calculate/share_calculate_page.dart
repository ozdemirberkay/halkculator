import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/config/theme/app_colors.dart';
import 'package:halkculator/shareds/widget/builder/profit_builder.dart';
import 'package:halkculator/shareds/widget/card/input_card.dart';
import 'package:halkculator/shareds/widget/database/share/add_share_button.dart';
import 'package:halkculator/shareds/widget/layout/layout.dart';

class ShareCalculateScreen extends StatefulWidget {
  const ShareCalculateScreen({super.key});

  @override
  State<ShareCalculateScreen> createState() => _ShareCalculateScreenState();
}

class _ShareCalculateScreenState extends State<ShareCalculateScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      floatingActionButton: const SaveShareButton(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: EdgeInsets.all(AppConstants.lowMargin),
        child: Column(
          children: [
            const ShareInputCard(),
            SizedBox(height: AppConstants.lowMargin),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              controller: tabController,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: AppColors.profitColor,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.lossColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.highMargin),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  ProfitBuilder(
                    calculationType: CalculationType.profit,
                  ),
                  ProfitBuilder(
                    calculationType: CalculationType.loss,
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

enum CalculationType { profit, loss }
