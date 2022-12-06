part of "pages.dart";

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  final splashDelay = 4;
  AnimationController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    _loadWidget();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
    
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Mainmenu()));
      UiToast.toastOk(
          "Welcome Back " + auth.currentUser!.displayName.toString());
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
      UiToast.toastOk(
          "Success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          "assets/lottie/car.json",
          width: 250,
          controller: _controller,
          onLoaded: (composition){
            _controller!
            ..duration = composition.duration
            ..forward();
          }
          )
        ),
    );
  }
}
