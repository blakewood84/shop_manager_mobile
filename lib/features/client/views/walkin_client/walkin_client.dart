import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageControllerProvider = Provider<PageController>((ref) => PageController(initialPage: 0));
final pageIndexProvider = StateProvider<double>((ref) => 0);

class WalkinClient extends ConsumerWidget {
  const WalkinClient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final controller = ref.read(pageControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * .75,
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) => ref.read(pageIndexProvider.notifier).state = value.toDouble(),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Page 1'),
                        ElevatedButton(
                          onPressed: () {
                            controller.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text('Next Page'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Page 2'),
                        ElevatedButton(
                          onPressed: () {
                            controller.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'Previous Page',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (_, ref, widget) {
              final index = ref.watch(pageIndexProvider);
              return DotsIndicator(
                dotsCount: 4,
                position: index,
                decorator: DotsDecorator(
                  activeColor: Colors.blue,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
