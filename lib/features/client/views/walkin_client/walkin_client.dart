import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/form.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/waiver.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/question1.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/question2.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/identification.dart';

final pageControllerProvider = Provider<PageController>((ref) => PageController(initialPage: 0));
final pageIndexProvider = StateProvider<double>((ref) => 0);

class WalkinClient extends ConsumerWidget {
  const WalkinClient({super.key});

  static const _pages = [
    Question1Page(),
    Question2Page(),
    IdentificationPage(),
    FormPage(),
    WaiverPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final controller = ref.read(pageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          const Center(
            child: Text(
              'Exit Sign Up',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * .75,
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) => ref.read(pageIndexProvider.notifier).state = value.toDouble(),
              children: const [
                ..._pages,
              ],
            ),
          ),
          Consumer(
            builder: (_, ref, widget) {
              final index = ref.watch(pageIndexProvider);
              return DotsIndicator(
                dotsCount: _pages.length,
                position: index,
                decorator: DotsDecorator(
                  activeColor: Colors.blue,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
