import 'package:flutter/material.dart';
import 'package:flutter_experiments/utils/data/wonders_data.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:flutter_experiments/widgets/wonders/expanding_card.dart';

class WondersScreen extends StatefulWidget {
  const WondersScreen({super.key});

  @override
  State<WondersScreen> createState() => _WondersScreenState();
}

class _WondersScreenState extends State<WondersScreen> {
  final PageController _pageController = PageController();
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('7 WONDERS'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.location_pin),
            onPressed: () {},
          ),
        ],
      );

  Widget buildBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: locations.length,
              onPageChanged: (index) => setState(() => currentPage = index + 1),
              itemBuilder: (context, index) {
                return ExpandingCard(
                  location: locations[index],
                );
              },
            ),
          ),
          20.verticalSpace,
          Text(
            '$currentPage / ${locations.length}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          20.verticalSpace,
        ],
      );

  Widget buildBottomNavigation() => BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      );
}
