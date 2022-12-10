import 'package:flutter/material.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/walkin_client.dart';

class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const WalkinClientScreen()));
                        },
                        child: const Text('Walkin'),
                      ),
                    ),
                    const SizedBox(width: 50),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Existing'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
