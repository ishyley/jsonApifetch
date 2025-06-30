import 'package:apilistview/model/post.dart';
import 'package:apilistview/services/api_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post>? post;
  var isLoading = false;
  // final notes = Database.notelist;

  getData() async {
    post = await ApiServices.fetchAllPost();
    if (post != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: isLoading,
              replacement: const Center(child: CircularProgressIndicator()),
              child: ListView.builder(
                itemCount: post?.length,

                itemBuilder: (context, index) {
                  final posts = post![index];
                  return ListTile(
                    title: Text('${posts.title}'),
                    trailing: Text('${posts.userId}'),
                    subtitle: Text('${posts.body}'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
