import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/walkin_client.dart';

class Question2Page extends ConsumerWidget {
  const Question2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Question2'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(pageControllerProvider).previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                },
                child: Text('Back Page'),
              ),
              const SizedBox(width: 40),
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
