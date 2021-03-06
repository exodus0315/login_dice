import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170,
                      height: 190,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                labelText: 'Enter "dice"',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(
                                labelText: 'Enter password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ButtonTheme(
                              minWidth: 100,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent,
                                ),
                                onPressed: () {
                                  if (controller.text == 'dice' &&
                                      controller2.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) => Dice()));
                                  } else if (controller.text == 'dice' &&
                                      controller2.text != '1234') {
                                    showSnackBar2(context);
                                  } else if (controller.text != 'dice' &&
                                      controller.text == '1234') {
                                    showSnackBar3(context);
                                  } else {
                                    showSnackBar(context);
                                  }
                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '????????? ????????? ?????? ???????????????',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '??????????????? ???????????? ????????????',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar3(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'dice??? ????????? ???????????????',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
