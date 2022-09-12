import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool persona = false;
  bool timer = false;
  bool tel1 = false;
  bool tel2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Container(
        height: 145,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://wilcity.com/wp-content/uploads/2021/02/avatar-default.png')),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Flutter McFlutter",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Experienced App Developer",
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('123 Main Street'), Text('(415) 555-0198')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      persona = !persona;
                      timer = false;
                      tel1 = false;
                      tel2 = false;
                      setState(() {});
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                            content:
                                Text('Únete a un club con otras personas')));
                    },
                    icon: Icon(
                      Icons.accessibility,
                      color: persona ? Colors.indigo : Colors.black,
                    ),
                ),
                IconButton(
                    onPressed: () {
                      timer = !timer;
                      persona = false;
                      tel1 = false;
                      tel2 = false;
                      setState(() {});
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                            content:
                                Text('Cuenta regresiva para el evento: 31 días')));
                    },
                    icon: Icon(
                      Icons.timer,
                      color: timer ? Colors.indigo : Colors.black,
                    ),
                ),
                IconButton(
                    onPressed: () {
                      tel1 = !tel1;
                      persona = false;
                      timer = false;
                      tel2 = false;
                      setState(() {});
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                            content:
                                Text('Llama al número 4155550198')));
                    },
                    icon: Icon(
                      Icons.phone_android,
                      color: tel1 ? Colors.indigo : Colors.black,
                    ),
                  ),

                IconButton(
                    onPressed: () {
                      tel2 = !tel2;
                      persona = false;
                      timer = false;
                      tel1 = false;
                      setState(() {});
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                            content:
                                Text('Llama al celular 3317865113')));
                    },
                    icon: Icon(
                      Icons.phone_iphone,
                      color: tel2 ? Colors.indigo : Colors.black,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
