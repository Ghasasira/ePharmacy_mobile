import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      //child: SearchAnchor(builder: builder, suggestionsBuilder: suggestionsBuilder),
    );
  }
}
