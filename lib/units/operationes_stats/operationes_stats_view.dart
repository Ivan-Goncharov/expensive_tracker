import 'dart:io';

import 'package:expensive_tracker_app/data/app_db/app_db.dart';
import 'package:expensive_tracker_app/units/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';

class OperationesStatsView extends StatelessWidget {
  const OperationesStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            children: [
              TextButton(
                child: const Text(
                  'Create new card',
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, addNewBalanceCardRoute),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    migrationBd();
                  },
                  child: const Text('Migration db'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> migrationBd() async {
    final dir = await getApplicationDocumentsDirectory();
    final name = join(
      dir!.path,
      'my_db.db',
    );
    final file = File(name)..createSync(recursive: true);
    if (file.existsSync()) {
      file.deleteSync();
    }

    await database.exportInto(file);

    print('DEBUG FILE ${file.existsSync()}');

    ///application/vnd.sqlite3
    await DocumentFileSavePlus.saveFile(
        file.readAsBytesSync(), 'my_db.db', 'application/vnd.sqlite3');
  }
}
