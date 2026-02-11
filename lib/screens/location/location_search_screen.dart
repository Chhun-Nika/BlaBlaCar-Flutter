import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/screens/location/widgets/location_tile.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../model/ride/locations.dart';

class LocationSearchScreen extends StatefulWidget {
  final Location? defaultLocation;
  const LocationSearchScreen({super.key, this.defaultLocation});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  // decleared an empty string for search bar
  // String searchText = '';
  final TextEditingController _textController = TextEditingController();

  // filter the list based on the searchText
  List<Location> get filteredListLocation {
    List<Location> result = [];
    if (_textController.text.isEmpty) {
      return result;
    }
    return fakeLocations
        .where(
          (l) =>
              l.name.toLowerCase().contains(
                _textController.text.toLowerCase(),
              ) ||
              l.country.name.toLowerCase().contains(
                _textController.text.toLowerCase(),
              ),
        )
        .toList();
  }

  void clearSearchBar() {
    _textController.clear();
    setState(() {});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.defaultLocation != null) {
      _textController.text = widget.defaultLocation!.name;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: BlaSpacings.m),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 30,
                color: BlaColors.neutralLight,
              ),
            ),
            title: TextField(
              controller: _textController,
              cursorColor: BlaColors.primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Station Road or the Bridge Cafe",
                hintStyle: TextStyle(color: BlaColors.neutralLighter),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
            trailing: _textController.text.isNotEmpty
                ? IconButton(
                    onPressed: clearSearchBar,
                    icon: Icon(
                      Icons.clear_rounded,
                      color: BlaColors.neutralLight,
                    ),
                  )
                : null,
          ),
          if (_textController.text.isNotEmpty && filteredListLocation.isEmpty)
            Text("No result found"),
          Expanded(
            child: filteredListLocation.isEmpty
                ? SizedBox.shrink()
                : ListView.builder(
                    itemCount: filteredListLocation.length,
                    itemBuilder: (context, index) {
                      return LocationTile(
                        location: filteredListLocation[index],
                      );
                    },
                  ),
          ),
          
        ],
      ),
    );
  }
}
