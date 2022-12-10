// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/form.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/identification.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/question1.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/question2.dart';
import 'package:shop_manager_mobile/features/client/views/walkin_client/pages/waiver.dart';

enum WorkType { tattoo, piercing, both }

enum AgeType { adult, minor }

final pageControllerProvider = Provider<PageController>(
  (ref) => PageController(initialPage: 0),
);

final pageIndexProvider = StateProvider<double>((ref) => 0);

final question1AnswerProvider = StateProvider<WorkType?>((ref) => null);
final question2AnswerProvider = StateProvider<AgeType?>((ref) => null);

@immutable
class WalkinClient {
  const WalkinClient({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.address,
  });

  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String address;

  @override
  String toString() {
    return 'WalkinClient(firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, address: $address)';
  }

  @override
  bool operator ==(covariant WalkinClient other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.dateOfBirth == dateOfBirth &&
        other.address == address;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^ lastName.hashCode ^ dateOfBirth.hashCode ^ address.hashCode;
  }
}

class IdentificationNotifier extends StateNotifier {
  IdentificationNotifier(super.state);

  // Properties:
  // -----------
  // File (Image Path)
  // Client Information

  // Methods:
  // -----------
  // - Scan ID
  // - Upload ID to Firebase Storage
  // - Retrieve Client Information from Image
  // - Upload Client Information to Firebase Firestore
  // - Set Client Information to State

}

// Create a package that scans an ID and retains the below information:

// Using Tessaract OCR package, when a client scan's their ID, we take their:
// - First Name
// - Last Name
// - Date of Birth
// - Address

// User scans their ID. We retrieve the above information and store to be used with Waiver signing.
// If the information is correct, we upload it and use on the next screen.
// If the information is incorrect, we ask the user to manually enter the information, then upload.

class WalkinClientScreen extends ConsumerWidget {
  const WalkinClientScreen({super.key});

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
