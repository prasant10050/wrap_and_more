<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# wrap_and_more

The wrap_and_more library provides a custom Flutter widget called WrapAndMore that allows you to display child widgets within a Wrap layout and handle cases where the number of children exceeds a specified maximum row count.

The `WrapAndMore` widget lays out its children in a Wrap widget and
displays the specified `overflowWidget` when the children exceed the
maximum number of rows specified by the `maxRow` parameter. The number
of children to display is automatically determined based on the available
space within the Wrap.

You can use this widget to achieve:

- Limiting the number of rows
- Get the count of the remaining children

## Features

![](https://raw.githubusercontent.com/ibnufth/wrap_and_more/main/example_image_1.png) ![](https://raw.githubusercontent.com/ibnufth/wrap_and_more/main/example_image_2.png)

## Getting started

In your flutter project `pubspec.yaml` add the dependency:

```yaml
dependencies:
  ...
  wrap_and_more: ^[version]
```

## Usage

This library doesn't use other library, so it should work out of the box.

Import `wrap_and_more.dart`.

```dart
import 'package:wrap_and_more/wrap_and_more.dart';
```

Add `WrapAndMore` in your `build` method.

```dart
WrapAndMore(
   maxRow: 2,
   spacing: 8.0,
   runSpacing: 8.0,
   overflowWidget: (restChildrenCount) {
     return Text(
       '+ $restChildrenCount more',
       style: TextStyle(color: Colors.grey),
     );
   },
   children: [
     // Add your widgets here
   ],
 )
```

Full example:

```dart
import 'package:flutter/material.dart';
import 'package:wrap_and_more/wrap_and_more.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  static const List<String> categories = [
    "Automotive",
    "Services",
    "Home and application",
    "Beauty and Care",
    "Fashion and Apparel",
    "Technology and Electronics",
    "Health and Wellness",
    "Food and Beverages",
    "Toys and Games",
    "Books and Entertainment",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wrap and More"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: 500,
          child: WrapAndMore(
            maxRow: 3,
            spacing: 5,
            runSpacing: 5,
            overflowWidget: (restChildrenCount) {
              return MyChip(text: "+$restChildrenCount");
            },
            children: categories
                .map(
                  (e) => MyChip(text: e),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  final String text;
  const MyChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

```

## Important parameters and explanation

|Parameter|Explanation|
|-----|-----|
|key|Key for `WrapAndMore`, used to call `WrapAndMoreState`|
|maxRow|The maximum number of rows to show within the Wrap|
|overflowWidget|The `overflowWidget` parameter is a function that takes an integer as input, representing the number of remaining children beyond the `maxRow`, and returns a widget to display as the "overflow" representation.|
|spacing|Parameters control the vertical spacing between children in the Wrap.|
|runSpacing|Parameters control the horizontal spacing between children in the Wrap.|
|children| The `children` parameter is a list of widgets to display within the Wrap.


## Issue

Please file any issues, bugs or feature requests as an issue on our GitHub page.
