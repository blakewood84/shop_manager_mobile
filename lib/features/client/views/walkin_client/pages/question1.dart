import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/walkin_client.dart';

class Question1Page extends ConsumerWidget {
  const Question1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Question1'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(pageControllerProvider).nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                },
                child: Text('Next Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
