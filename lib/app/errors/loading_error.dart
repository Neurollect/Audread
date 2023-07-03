import 'package:flutter/material.dart';

class LoadingError extends StatefulWidget {
  const LoadingError({Key? key}) : super(key: key);

  @override
  LoadingErrorState createState() => LoadingErrorState();
}

class LoadingErrorState extends State<LoadingError> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(image: AssetImage('assets/images/gif/err.gif')),
    );
  }
}
