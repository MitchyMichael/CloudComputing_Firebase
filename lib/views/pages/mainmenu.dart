part of "pages.dart";

class Mainmenu extends StatefulWidget {
  const Mainmenu({Key? key}) : super(key: key);

  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[Student(), Account()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _widgetOption.elementAt(_selectedIndex),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dataset), 
          label: "Student"),
        
        BottomNavigationBarItem(
            icon: Icon(Icons.verified_user), 
            label: "Account"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      ),
    );
  }
}
