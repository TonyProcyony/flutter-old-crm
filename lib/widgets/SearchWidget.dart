import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({super.key, this.string});

  final void Function(String query)? string;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: "Cerca prodotti",
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Theme.of(context).colorScheme.primary,
        ),
        onChanged: (value) {
          widget.string!(_controller.text.trim());
        },
      ),
    );
  }
}
