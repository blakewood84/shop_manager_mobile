import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/question2.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/walkin_client.dart';

class Question1Page extends ConsumerWidget {
  const Question1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'What type of work are you getting today?',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(360),
                    ),
                  ),
                  onPressed: () {
                    ref.read(question1AnswerProvider.notifier).state = WorkType.tattoo;
                    ref
                        .read(pageControllerProvider)
                        .nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  },
                  child: const Text(
                    'Tattoo',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(360),
                    ),
                  ),
                  onPressed: () {
                    ref.read(question1AnswerProvider.notifier).state = WorkType.piercing;
                    ref
                        .read(pageControllerProvider)
                        .nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  },
                  child: const Text(
                    'Piercing',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(360),
                    ),
                  ),
                  onPressed: () {
                    ref.read(question1AnswerProvider.notifier).state = WorkType.both;
                    ref
                        .read(pageControllerProvider)
                        .nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  },
                  child: const Text(
                    'Both',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
                SizedBox(width: 5.0),
                Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
