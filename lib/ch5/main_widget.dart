import 'package:flutter/material.dart';
import 'package:flutter_lab/ch5/assets_widget.dart';
import 'package:flutter_lab/ch5/form_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  /// 선택된 탭.. 상태..
  List<Widget> widgets = [
    AssetsWidget(),
    FormWidget(),
  ];

  /// tab button click event..
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink,

          /// 앱의 대표 칼라. appbar background, button background...
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
          )),
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: const Text('AppBar Bottom Text'),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/big.jpeg'), fit: BoxFit.fill),
            ),
          ),
          title: const Text('Widget Test'),

          /// appbar 에서 제공하는 유저 이벤트..
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next)),
          ],
        ),
        body: Center(
          child: widgets.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,

          /// 탭 버튼 조정시 약간의 애니메이션 효과.. fixed - 고정
          items: const [
            BottomNavigationBarItem(
              /// 탭 버튼..
              icon: Icon(Icons.home),
              label: 'first',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'second',
              backgroundColor: Colors.purple,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: onTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('Item1'),
              ),
              ListTile(
                title: Text('Item2'),
              ),
              ListTile(
                title: Text('Item3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
