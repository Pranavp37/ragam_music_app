import 'package:flutter/material.dart';
import 'package:ragam/common/helpers/is_dark_mode.dart';
import 'package:ragam/common/widgets/appbar/app_bar.dart';
import 'package:ragam/core/configs/assets/app_image.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';
import 'package:ragam/presentation/home/widgets/news_songs.dart';
import 'package:ragam/presentation/home/widgets/play_list.dart';
import 'package:ragam/presentation/profile/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabcontroller;
  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        action: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ));
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            )),
        hidebackBtn: true,
        titile: Image.asset(
          AppImage.logo,
          height: 85,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _homeTopCard(),
            _tabbar(),
            SizedBox(
              height: 200,
              child: TabBarView(
                controller: _tabcontroller,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const SizedBox(
            height: 181,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 30),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'New album\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: 'Happier Than Ever\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Billie Ellish',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 9.55,
            child: Image.asset(
              AppImage.homePageModel,
              height: 190,
            ),
          )
        ],
      ),
    );
  }

//
  Widget _tabbar() {
    return TabBar(
      controller: _tabcontroller,
      padding: const EdgeInsets.symmetric(vertical: 40),
      labelColor: context.isDarkmode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      // isScrollable: true,
      tabs: const [
        Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Text(
          'Podcast',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
