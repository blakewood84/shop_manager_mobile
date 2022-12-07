import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckAuthentication extends StatelessWidget {
  const CheckAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(height: 100),
          Text('Check Authentication'),
        ],
      ),
    );
  }
}