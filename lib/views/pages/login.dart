part of "pages.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHide = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    super.dispose();
  }

  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Form(
                key: _loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlEmail,
                      decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                      validator: (value) {
                        return !EmailValidator.validate(value.toString())
                            ? "Email is not valid"
                            : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: isHide,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlPass,
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          suffixIcon: new GestureDetector(
                            onTap: () {
                              setState(() {
                                isHide = !isHide;
                              });
                            },
                            child: Icon(!isHide
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      validator: (value) {
                        return value!.length < 6
                            ? "Password must at least 6 characters"
                            : null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text("Sign in")),
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      thickness: 2,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          signInWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        label: Text("Sign in with Google"),
                        icon: FaIcon(FontAwesomeIcons.google),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Don't have an account? Sign up here",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        ],
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     signInWithGoogle();
      //   },
      //   tooltip: 'Increment',
      //   label: Text("Sign in with Google"),
      //   icon: FaIcon(FontAwesomeIcons.google),
      // ),
    );
  }
}