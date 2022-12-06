part of "pages.dart";

class Student extends StatefulWidget {
  const Student({ Key? key }) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
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