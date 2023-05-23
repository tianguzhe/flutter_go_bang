import 'package:flutter/material.dart';
import 'package:go_bang/pages/count/two_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_page.g.dart';

@riverpod
class Count extends _$Count {
  @override
  num build() => 0;

  void incument() {
    state++;
  }

  void mincument() {
    state--;
  }
}

class CountPage extends ConsumerWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("first page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$count"),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TwoCountPage(),
                ),
              ),
              child: const Text("go go go"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(countProvider.notifier).incument,
        child: const Icon(Icons.add),
      ),
    );
  }
}
