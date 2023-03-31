import 'package:flutter/material.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const ProfilePage(),
            theme: ThemeData(
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ),
            themeMode: currentMode,
          );
        });
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int level = 0;
  String buttonText = "Follow Me";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Profile.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              setState(() {
                Profile.themeNotifier.value =
                    Profile.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            level++;
          });
        },
        shape: const StadiumBorder(side: BorderSide(width: 1.5)),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 55,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/icon.jpg"),
                  radius: 50,
                ),
              ),
            ),
            const Divider(
              height: 100,
            ),
            const Text(
              "NAME",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Sarthak Khandelwal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "LEVEL",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$level",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: const [
                Icon(
                  Icons.email,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "sarthakhandelwal@gmail.com",
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Icon(
                  Icons.phone,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "9876543210",
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (buttonText == "Follow Me") {
                      buttonText = "Following";
                    } else if (buttonText == "Following") {
                      buttonText = "Follow Me";
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12.5),
                    shape: const StadiumBorder(
                        side: BorderSide(
                      width: 1.5,
                    ))),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 17.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
