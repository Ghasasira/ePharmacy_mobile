import 'package:flutter/material.dart';
import 'package:pharmacy_skeleton/pharmacy_components/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SearchTabWidgetActive(),
        ),
      ),
      body: Container(),
      // Use a CustomScrollView for persistent search field
      // body: CustomScrollView(
      //   slivers: [
      //     // Fixed search bar at the top
      //     SliverAppBar(
      //       pinned: true, // Keep search bar visible when scrolling
      //       title: SearchTabWidgetActive(),
      //     ),
      //     // Rest of your content here
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => // Your search result widgets at each index
      //             ListTile(
      //           title: Text("Search Result $index"),
      //         ),
      //         childCount: 100, // Replace with your actual number of results
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
