import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/ui/pages/home/sidebar/sidebar.exports.dart';
import 'package:moffice_web/ui/pages/pages.exports.dart';

class Home extends StatelessWidget {

  Home({Key? key}) : super(key: key);

  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         Container(
             margin: const EdgeInsets.only(left: Dimens.size80),
             child: PageView(
               controller: page,
               children: [
                 MainPage(),
                 Container(
                   color: Colors.white,
                   child: const Center(
                     child: Text(
                       'Ký điện tử',
                       style: TextStyle(fontSize: 35),
                     ),
                   ),
                 ),
                 Container(
                   color: Colors.white,
                   child: const Center(
                     child: Text(
                       'Văn bản',
                       style: TextStyle(fontSize: 35),
                     ),
                   ),
                 ),
                 Container(
                   color: Colors.white,
                   child: const Center(
                     child: Text(
                       'Quản trị',
                       style: TextStyle(fontSize: 35),
                     ),
                   ),
                 ),
                 Container(
                   color: Colors.white,
                   child: const Center(
                     child: Text(
                       'Dashboard',
                       style: TextStyle(fontSize: 35),
                     ),
                   ),
                 ),
               ],
             )
         ),
         SideBar(
           onTap: (int index){
             page.jumpToPage(index);
           },
         ),
       ],
     ),
   );
  }
}