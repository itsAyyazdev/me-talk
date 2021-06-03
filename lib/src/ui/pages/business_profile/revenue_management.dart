import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:me_talk/src/blocs/bloc_business_profile/bloc.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import 'package:vibrate/vibrate.dart';

class RevenueManagement extends StatefulWidget {
  static const String routeName = "RevenueManagement";
  RevenueManagement({Key key}) : super(key: key);

  @override
  _RevenueManagementState createState() => _RevenueManagementState();
}

class _RevenueManagementState extends State<RevenueManagement> {
  BusinessProfileBloc businessProfileBloc = BusinessProfileBloc();
  @override
  void dispose() {
    businessProfileBloc.close();
    super.dispose();
  }

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
              appBar: AppBar(
                elevation: 6,
                backgroundColor: ColorsHelper.whiteColor(),
                leading: IconButton(
                  icon: Image.asset(
                    ImageAssets.back_arrow,
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Vibrate.feedback(FeedbackType.light);
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  StringHelper.revenue_management,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                // actions: <Widget>[
                //   Container(
                //     margin: EdgeInsets.only(right: 20),
                //     child: InkWell(
                //       child: Image.asset(
                //         ImageAssets.notification,
                //         width: 25.0,
                //         height: 25.0,
                //         fit: BoxFit.contain,
                //       ),
                //       onTap: () {},
                //     ),
                //   ),
                // ],
              ),
              body: BlocProvider(
                create: (BuildContext context) => businessProfileBloc,
                child: BlocBuilder(
                  bloc: businessProfileBloc,
                  builder: (BuildContext context, BusinessProfileState state) {
                    if (state is InitialBusinessProfileState) {
                      return revenueManagement();
                    } else {
                      return Container(
                        color: Colors.black,
                      );
                    }
                  },
                ),
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Vibrate.feedback(FeedbackType.light);
                        pageController.previousPage(
                            duration: Duration(milliseconds: 450),
                            curve: Curves.easeInCubic);
                      },
                      icon: Icon(
                        FontAwesomeIcons.caretLeft,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "2019",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Vibrate.feedback(FeedbackType.light);
                        pageController.nextPage(
                            duration: Duration(milliseconds: 450),
                            curve: Curves.easeInCubic);
                      },
                      icon: Icon(
                        FontAwesomeIcons.caretRight,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget revenueManagement() {
    return ScrollConfiguration(
      behavior: ListViewScrollBehavior(),
      //
      //Page View for year change
      //
      child: PageView.custom(
          controller: pageController,
          physics: PageScrollPhysics(),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    // color: RandomColor().randomColor(),
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 25),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "2019",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(StringHelper.revenue,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(StringHelper.complete_r,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("421,002",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("3214",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //
                    //Grid View for month change
                    //
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: MediaQuery.of(context).size.height * 0.62,
                    child: GridView.custom(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 6,
                          crossAxisCount: 3,
                          childAspectRatio: 1.05),
                      //  shrinkWrap: true,
                      childrenDelegate:
                          SliverChildBuilderDelegate((context, index2) {
                        return Stack(children: <Widget>[
                          Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.transparent,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                    ),
                                    Text(StringHelper.revenue,
                                        style: TextStyle(
                                          fontSize: 11,
                                        )),
                                    Text("421,002",
                                        style: TextStyle(
                                          fontSize: 11,
                                        )),
                                    Text(StringHelper.complete_r,
                                        style: TextStyle(
                                          fontSize: 11,
                                        )),
                                    Text("12",
                                        style: TextStyle(
                                          fontSize: 11,
                                        )),
                                  ],
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.all(4),
                            height: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              color: ColorsHelper.themeBlackColor(),
                            ),
                            child: Center(
                              child: Text(
                                "${index2 + 1}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ]);
                      }, childCount: 12),
                    ),
                  )
                ],
              ),
            );
          }, childCount: 5)),
    );
  }
}
