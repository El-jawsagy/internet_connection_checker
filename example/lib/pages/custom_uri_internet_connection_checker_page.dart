// Dart Packages

// Flutter Packages

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker_example/blocs/custom_url_internet_cubit/custom_url_internet_cubit.dart';

// Project imports:

/// A `StatelessWidget` that checks the internet connection status using custom URIs.
///
/// The `CustomURIInternetConnectionCheckerPage` class is a `StatelessWidget` that
/// demonstrates how to use custom URIs with the `InternetConnectionChecker` package
/// to check the internet connection status. The current connection status is displayed
/// on the screen in real-time.
class CustomURIInternetConnectionCheckerPage extends StatelessWidget {
  const CustomURIInternetConnectionCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom URIs'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This example shows how to use custom URIs to check the internet '
                'connection status.',
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 48.0,
                thickness: 2.0,
              ),
              const Text('Connection Status:'),
              // BlocBuilder listens to the InternetCubit to reflect the current connection status
              BlocBuilder<CustomUrlInternetCubit, InternetConnectionStatus?>(
                builder: (context, connectionStatus) {
                  if (connectionStatus == null) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  return Text(
                    connectionStatus.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
