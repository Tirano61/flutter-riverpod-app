import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}


class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    
    final userInChat = ref.watch(userInChatProvider);
    if( !userInChat.hasValue ){
      return const CircularProgressIndicator();
    }
    return ListView.builder(
      itemCount: userInChat.value?.length,
      itemBuilder: (BuildContext context, int index){
        final name = userInChat.value![index];
        return ListTile(
          title: Text(name),
        );
      }
    );
  }
}