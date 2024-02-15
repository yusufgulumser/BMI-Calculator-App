import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SavedResultsPage extends StatelessWidget {
  const SavedResultsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Results'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('results').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final results = snapshot.data!.docs;
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return Dismissible(
                key: ValueKey(result.id),
                onDismissed: (direction) => FirebaseFirestore.instance
                    .collection('results')
                    .doc(result.id)
                    .delete(),
                background: Container(
                  color: Theme.of(context).colorScheme.onError,
                ),
                child: ListTile(
                  title: Text(result['resultText']),
                  subtitle: Text(result['bmiResult']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
