part of "pages.dart";

class Mainmenu extends StatefulWidget {
  const Mainmenu({ Key? key }) : super(key: key);

  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello" + FirebaseAuth.instance.currentUser!.displayName.toString()),
        actions: [
          IconButton(
            onPressed: (){
              
            }, 
            icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}