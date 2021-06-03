
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/ui/pages/beauty/event_detail_screen.dart';
import 'package:me_talk/src/ui/pages/beauty/event_details_view.dart';
import 'package:me_talk/src/ui/pages/beauty/shop_list_view.dart';
import 'package:me_talk/src/utils/silver_header_delegate.dart';


class LatestVisitedScreen extends StatefulWidget {
  @override
  _LatestVisitedScreenState createState() => _LatestVisitedScreenState();
}

class _LatestVisitedScreenState extends State<LatestVisitedScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 0.0,
                floating: false,
                pinned: true,
                leading: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset(
                    ImageAssets.back_arrow,
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title:
                Text(
                  StringHelper.latest_visited_place,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: FontsHelper.fonts_HyGothic_regular
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: Color(0xff2E2E2E),
                    isScrollable: false,
                    indicatorWeight: 3,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: FontsHelper.fonts_HyGothic_regular
                    ),
                    tabs: [
                      Tab(text: StringHelper.beauty_title,),
                      Tab(text: StringHelper.hospital_title,),
                    ],
                  ),
                  15,
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 15),
                    child: ShopListView(index: index,));
                    },
                ),
              ),
              Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        onCellItemClick(index);
                        },
                      child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 20.0, bottom: 10),
                      child: EventDetailsView(index: index,)),
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

  void onCellItemClick(int index) async {
    print('Row $index');
    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }


}

