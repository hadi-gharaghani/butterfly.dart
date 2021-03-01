import 'dart:math';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LogIn(),
  ));
}

//pages
class LogIn extends StatelessWidget {
  SignUpModel singUpModel = SignUpModel();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8ab58b),
      appBar: AppBar(
        elevation: 9,
        centerTitle: true,
        shadowColor: Colors.lightGreen,
        backgroundColor: (Colors.green),
        title: Text("Log-In Page",
            style: TextStyle(color: Colors.lime, fontSize: 27)),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
                decoration:
                    InputDecoration(labelText: "email", fillColor: Colors.lime),
                onSaved: (text) {
                  singUpModel.email = text;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "password", focusColor: Colors.lime),
                onSaved: (text) {
                  singUpModel.password = text;
                },
                validator: (text) {
                  if (text.length > 6) {
                    return "password is too short";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: OutlineButton(
                splashColor: Colors.blueGrey,
                highlightedBorderColor: Colors.green,
                highlightColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  formkey.currentState.save();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyHomePage()));
                },
                child: Text("SIGN IN",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black87)),
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(right: 30, left: 35),
                child: Text("Forgot Password ? click here ",
                    style: TextStyle(color: Colors.black38, fontSize: 20,letterSpacing: 2.2))),
            SizedBox(height: 20),
            Center(
              child: OutlineButton(
                splashColor: Colors.blueGrey,
                highlightedBorderColor: Colors.green,
                highlightColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  showDialog(
                      barrierColor: Color(0x88002901),
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          "This Page Doesn't Exist",
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 17),
                        ),
                        elevation: 7,
                      ));
                },
                child: Text("SIGN UP",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black87)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> pages = [Page1(), Page2(), CountdownTimerApp(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("бабочка"),
        actions: [
          Builder(
            builder: (BuildContext bc) => IconButton(
                icon: Icon(CupertinoIcons.antenna_radiowaves_left_right),
                onPressed: () {
                  //this will show a snack bar
                  Scaffold.of(bc).showSnackBar(SnackBar(
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Not In Your Country XD",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          IconButton(
                            icon:
                                Icon(Icons.report_problem, color: Colors.white),
                            splashColor: Colors.deepOrange,
                            onPressed: () {
                              Scaffold.of(bc).openDrawer();
                            },
                          ),
                        ]),
                    elevation: 20,
                    backgroundColor: Colors.black38,
                  ));
                }),
          ),
        ],
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.50),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.mirror),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 7,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              otherAccountsPictures: [
                IconButton(
                    icon: Icon(CupertinoIcons.moon_zzz_fill,
                        size: 28, color: Colors.white),
                    onPressed: () {
                      print("night");
                    },
                    splashColor: Colors.teal)
              ],
              currentAccountPicture: Hero(
                tag: "profile",
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.jpg'),
                ),
              ),
              onDetailsPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Profile()));
              },
              arrowColor: Colors.white,
              accountName: Text("hadi.gh"),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xa5e568FF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              accountEmail: Text("+98 994 480 01 50"),
            ),
            ListTile(
              subtitle: Text(
                "Tap to Share This App",
                style: TextStyle(color: Colors.grey),
              ),
              title: Text("Share", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    barrierColor: Color(0x44e00202),
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "Google Don Let us Grow",
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.share_outlined,
                color: Colors.teal,
              ),
            ),
            ListTile(
              subtitle: Text(
                "Tap to help us grove",
                style: TextStyle(color: Colors.grey),
              ),
              title: Text("Rate us", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    barrierColor: Color(0x27fbff00),
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "Thanks Really 🧡🧡🧡🧡🧡",
                            style: TextStyle(color: Colors.teal, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.star_border_rounded,
                color: Colors.teal,
              ),
            ),
            ListTile(
              subtitle: Text(
                "Tap to Feedback us",
                style: TextStyle(color: Colors.grey),
              ),
              title: Text("Feedback", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    barrierColor: Color(0x27fbff00),
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "google is mad dog XD",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.add_comment_outlined,
                color: Colors.teal,
              ),
            ),
            Divider(
              indent: 70,
              endIndent: 10,
              color: Colors.blueGrey,
              thickness: 0.7,
            ),
            ListTile(
              subtitle: Text(
                "Tap to Join Q/A Group",
                style: TextStyle(color: Colors.grey),
              ),
              title: Text("FAQ", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    barrierColor: Color(0x2200ff6e),
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "go to hell XD",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.question_answer_outlined,
                color: Colors.teal,
              ),
            ),
            ListTile(
              subtitle: Text(
                "Tap to know More About App",
                style: TextStyle(color: Colors.grey),
              ),
              title:
                  Text("Terms of use", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    barrierColor: Color(0x2200ff6e),
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "کلوا وشربوا و لا تصرفوا XD",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.search_outlined,
                color: Colors.teal,
              ),
            ),
            ListTile(
              subtitle: Text(
                "Tap to Agree with needs",
                style: TextStyle(color: Colors.grey),
              ),
              title: Text("Privacy policy",
                  style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    barrierColor: Color(0x2200ff6e),
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "will add soon XD",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.local_police_outlined,
                color: Colors.teal,
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 70,
              color: Colors.blueGrey,
              thickness: 0.7,
            ),
            ListTile(
              subtitle: Text("Tap to Edit Settings",
                  style: TextStyle(color: Colors.grey)),
              title: Text("Setting", style: TextStyle(color: Colors.black87)),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SettingsPage()));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.teal,
              ),
            ),
            ListTile(
              subtitle: Text("Tap to realize powerful app",
                  style: TextStyle(color: Colors.grey)),
              title:
                  Text("Go Premium", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            "Not Match With UR IP !",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                          elevation: 7,
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                CupertinoIcons.snow,
                color: Colors.teal,
              ),
            ),
            ListTile(
              subtitle: Text(
                "Tap to Report a Problem",
                style: TextStyle(color: Colors.grey),
              ),
              title: Text("Report", style: TextStyle(color: Colors.black87)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                          title: Text("Report !"),
                          content: Text("Do You Want To Really Report"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("No!"),
                              onPressed: () {},
                            ),
                            CupertinoDialogAction(
                              child: Text("Yes!"),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text(
                                            "Not Match With UR IP !",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17),
                                          ),
                                          elevation: 7,
                                        ));
                              },
                            )
                          ],
                        ));
              },
              focusColor: Colors.blueGrey,
              leading: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF00CCFF),
          elevation: 3,
          fixedColor: Colors.teal,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                title: Text("Forum"),
                icon: Icon(CupertinoIcons.chat_bubble_2),
                backgroundColor: Color(0xff940d5a)),
            BottomNavigationBarItem(
                title: Text("VPN"),
                icon: Icon(Icons.shield),
                backgroundColor: Color(0xff940d0d)),
            BottomNavigationBarItem(
                title: Text("Timer"),
                icon: Icon(Icons.alarm),
                backgroundColor: Color(0xff0d5594)),
            BottomNavigationBarItem(
                title: Text("Setting"),
                icon: Icon(Icons.settings),
                backgroundColor: Color(0xff94310d)),
          ]),
    );
  }
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactList(contacts),
      backgroundColor: Colors.lightGreen,
    );
  }
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(left: 58, right: 30),
            width: 100,
            height: 100,
            child: Image.asset(
              "images/Wait.gif",
              fit: BoxFit.cover,
            )),
        Divider(
          color: Colors.transparent,
          height: 50,
        ),
        Text("   This Page Doesn't Exist",
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class CountdownTimerApp extends StatefulWidget {
  @override
  _CountdownTimerAppState createState() => _CountdownTimerAppState();
}

class _CountdownTimerAppState extends State<CountdownTimerApp> {
  Timer timer;
  var minute = 0;
  var seconds = 0;
  int totalTime;

  void startTimer() {
    final oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      totalTime = minute * 60 + seconds;
      setState(() {
        if (totalTime < 1) {
          timer.cancel();
        } else {
          if (seconds == 0) minute -= 1;
          totalTime -= 1;
          seconds = (totalTime % 60);
        }
      });
    });
  }

  void setSeconds(value) {
    setState(() {
      seconds = value;
    });
  }

  void setMinutes(value) {
    setState(() {
      minute = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.yellow),
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Center(
          child: Text(
            '$minute:$seconds',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.teal,
          backgroundColor: Colors.lightGreenAccent,
          onPressed: () {
            showDialog(
              context: context,
              child: SimpleDialog(
                backgroundColor: Colors.blueGrey,
                contentPadding: EdgeInsets.all(15),
                children: [
                  Text(
                    'Set your time',
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                  DropdownButton<int>(
                    dropdownColor: Colors.blueGrey,
                    value: minute,
                    icon: Text('Minute',
                        style: TextStyle(color: Colors.yellowAccent)),
                    items: List.generate(60, (index) {
                      return DropdownMenuItem(
                        value: index,
                        child: Text(index.toString(),
                            style: TextStyle(color: Colors.yellowAccent)),
                      );
                    }),
                    onChanged: setMinutes,
                  ),
                  DropdownButton<int>(
                    dropdownColor: Colors.blueGrey,
                    value: seconds,
                    icon: Text('Seconds',
                        style: TextStyle(color: Colors.yellowAccent)),
                    items: List.generate(60, (index) {
                      return DropdownMenuItem(
                        value: index,
                        child: Text(index.toString(),
                            style: TextStyle(color: Colors.yellowAccent)),
                      );
                    }),
                    onChanged: setSeconds,
                  ),
                  SizedBox(height: 15),
                  OutlinedButton(
                    child: Text('Start',
                        style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      startTimer();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          },
          child: Icon(
            Icons.alarm_add_outlined,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Content settings"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new LogIn()));
                },
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

// ××××××××××××××××××××××××××××××××××××××÷××
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade400,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.deepOrange,
                ],
                begin: const FractionalOffset(0.0, 0.50),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.mirror),
          ),
        ),
        bottomOpacity: 20,
        title: Text("Hadi Gharaghani",
            style: TextStyle(fontSize: 27, color: Colors.white)),
        centerTitle: true,
        excludeHeaderSemantics: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
              tag: "profile",
              child: Image.asset("images/logo.jpg", fit: BoxFit.cover)),
          Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "Hello i'm Hadi Gharaghani, I'm 16 , I'm in 10'th grade at Shams Tabrizi high school, and I'm studying at Since ",
                style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                    wordSpacing: 20,
                    fontWeight: FontWeight.w600),
              )),
          Container(
            color: Colors.pink,
            child: Text(
              "  Flutter Developer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            height: 50,
            width: 340,
          ),
          Divider(),
          RaisedButton(
            child: Text(
              "           Home           ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MyHomePage()));
            },
            color: Colors.pink,
            elevation: 7,
            splashColor: Colors.teal,
          )
        ],
      ),
    );
  }
}

//class
class Contact {
  String firstName;
  String lastName;

  Contact(this.firstName, [this.lastName]);
}

class ContactListItem extends StatefulWidget {
  // Contact item
  final Contact contact;

  // Constructor
  ContactListItem(this.contact);

  @override
  _ContactListItemState createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.black,
    Colors.teal
  ];
  Random random = new Random();

  int hello = 0;

  void changeIndex() {
    setState(() => hello = random.nextInt(5));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => changeIndex(),
      leading: CircleAvatar(
        backgroundColor: colors[hello],
        child: Text(
          "${widget.contact.firstName[0]}${widget.contact.lastName[0]}",
          style: TextStyle(fontSize: 20),
        ),
      ),
      title: Text("${widget.contact.firstName} ${widget.contact.lastName}",
          style: TextStyle(fontSize: 20)),
    );
  }
}

class ContactList extends StatelessWidget {
  // List variable to store list of contacts
  final List<Contact> contacts;

  ContactList(this.contacts);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: contacts.map((Contact contact) {
        return ContactListItem(contact);
      }).toList(),
    );
  }
}

class SignUpModel {
  String email;
  String password;

  SignUpModel({this.email, this.password});
}

List<Contact> contacts = [
  Contact("Hadi", "Gharghani"),
  Contact("Ali", "Felani"),
  Contact("Farzad", "Alias"),
  Contact("Mash", "Gorban"),
  Contact("Mafiay", "Jam"),
  Contact("Hassan", "Rohani"),
  Contact("Iman", "Jely"),
  Contact("Ilan", "Musk"),
  Contact("Muz", "Frosh"),
  Contact("Soltan", "Morq"),
  Contact("Yaroslav", "Ruusianov"),
  Contact("Pavel", "Finlandy"),
  Contact("Noon", "After"),
];
//          1016       Lines      WOW ********************************************************************************
