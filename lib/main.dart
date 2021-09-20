import 'package:flutter/material.dart';

import 'ui/screens/transfer/transfer_list.dart';

const startScreen = '/';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: startScreen,
      routes: {
        startScreen: (context) => TransferList(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
      ),
    );
  }
}
