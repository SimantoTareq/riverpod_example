import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/api2/provider.dart';
import 'package:riverpod_example/api2/service.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final _data= ref.watch(usersDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: _data.when(
          data: (_data){
            List userList = _data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                      Expanded(child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (_,index){
                        return Card(
                            color: Colors.blue,
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(userList[index].firstName, style: const TextStyle(
                                  color: Colors.white
                              ),),
                              subtitle: Text(userList[index].lastName, style: const TextStyle(
                                  color: Colors.white
                              )),
                              trailing: CircleAvatar(
                                backgroundImage: NetworkImage(userList[index].avatar),
                              ),
                            ),
                          );
                        
                      }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}