import 'package:flutter/material.dart';
import 'package:go_bang/pages/count/count_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TwoCountPage extends StatelessWidget {
  const TwoCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("two count page"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            debugPrint("Text");
            final count = ref.watch(countProvider);
            return Text("$count");
          },
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          debugPrint("floatingActionButton");
          return FloatingActionButton(
            onPressed: ref.read(countProvider.notifier).mincument,
            child: child,
          );
        },
        child: const Icon(
          Icons.mic_none,
        ),
      ),
    );
  }
}
