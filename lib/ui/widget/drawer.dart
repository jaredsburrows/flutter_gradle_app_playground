import 'package:flutter/material.dart';
import 'package:flutter_gradle_app_playground/ui/home/home_page.dart';

int selectedIndex = 0;
int index = 0;

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          PageListTile(
              icon: const HomePage().icon(),
              pageName: const HomePage().title(),
              isSelected: selectedIndex == index++,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const HomePage();
                  },
                ));
              }),
          const Divider(),
          const AboutListTile(
            child: Text('About'),
            applicationName: 'Flutter Playground',
            applicationVersion: 'v1.0.0',
            applicationIcon: Icon(Icons.adb),
            icon: Icon(Icons.info),
          )
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('res/images/Icon-512.png'))),
        child: Stack(children: const <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text('Flutter Step-by-Step',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500))),
        ]));
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    Key? key,
    required this.icon,
    required this.pageName,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String pageName;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      leading: Icon(icon),
      title: Text(pageName),
      onTap: onTap,
    );
  }
}