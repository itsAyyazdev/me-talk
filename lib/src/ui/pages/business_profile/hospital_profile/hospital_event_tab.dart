
import 'package:flutter/material.dart';
import 'package:me_talk/src/ui/pages/beauty/event_detail_screen.dart';
import 'package:me_talk/src/ui/pages/home_page/event_details_view.dart';

class HospitalEventTab extends StatefulWidget {
  @override
  _HospitalEventTabState createState() => _HospitalEventTabState();
}

class _HospitalEventTabState extends State<HospitalEventTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 50,bottom: 75),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 9,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                onCellItemClick(index);
              },
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 10, bottom: 10),
                  child: EventDetailsView(index: index,)),
            );
          },
        ),
      ),
    );
  }

  void onCellItemClick(int index) async {
    print('Row $index');
    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
  }

}
