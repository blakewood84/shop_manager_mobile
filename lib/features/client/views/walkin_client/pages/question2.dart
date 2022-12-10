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
          const Text(
            'Are you an Adult or a Minor?',
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
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(360),
                    ),
                  ),
                  onPressed: () {
                    ref.read(question2AnswerProvider.notifier).state = AgeType.adult;
                    ref
                        .read(pageControllerProvider)
                        .nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                  },
                  child: const Text(
                    'Adult',
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
                    backgroundColor: Colors.greenAccent,
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
                    'Minor',
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
              ref
                  .read(pageControllerProvider)
                  .previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
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
