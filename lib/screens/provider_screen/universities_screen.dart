import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/university_provider.dart';

class UniversitiesScreenWidget extends StatefulWidget {
  const UniversitiesScreenWidget({Key? key}) : super(key: key);

  @override
  State<UniversitiesScreenWidget> createState() =>
      _UniversitiesScreenWidgetState();
}

class _UniversitiesScreenWidgetState extends State<UniversitiesScreenWidget> {
  @override
  void initState() {
    super.initState();
    // Uncomment if you want to load the universities every time the screen is opened
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<UniversityProvider>().getUniversities();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return context.read<UniversityProvider>().getUniversities();
        },
        child: Consumer<UniversityProvider>(
          builder: (context, universityProvider, child) {
            // If the universities are still loading, show a progress indicator
            if (universityProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // If there are no universities, show a message
            if (universityProvider.universities.isEmpty) {
              return const Center(
                child: Text('No universities found'),
              );
            }

            // If there are universities, show them in a ListView
            final universities = universityProvider.universities;
            return ListView.builder(
              itemCount: universities.length,
              itemBuilder: (context, index) {
                final university = universities[index];
                return ListTile(
                  title: Text(university.name),
                  subtitle: Text(university.country),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      universityProvider.removeUniversity(university.name);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
