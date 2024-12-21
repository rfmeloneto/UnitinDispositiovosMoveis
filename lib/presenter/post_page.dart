import 'package:flutter/material.dart';
import 'package:primeiro_app/domain/post_entity.dart';
import 'package:primeiro_app/presenter/post_notifyer.dart';
import 'package:primeiro_app/presenter/store_post.dart';

class PostPage extends StatefulWidget {
  final StorePost store = StorePost();
  PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late PostNotifyer notifyer;
  @override
  void initState() {
    super.initState();
    notifyer = widget.store.postNotifyer;
  }
  @override
  void dispose() {
    super.dispose();
    notifyer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: notifyer,
              builder: (context, child) {
                if(notifyer.isLoading){
                    return Center(child: CircularProgressIndicator());
                  }
                if(notifyer.posts.isEmpty){
                  return Center(child: Text(notifyer.message));
                }
                return ListView.builder(
                itemCount: notifyer.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8.0,
                    color: Colors.grey.shade400,
                    child: ListTile(
                      title: Text(notifyer.posts[index].title),
                      subtitle: Text(notifyer.posts[index].body),
                    ),
                  );
                }
                              );
              },
            ),

          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(onPressed: () { 
                  notifyer.getPosts(null);
                  
                  },
                  child: Text("Carregar posts")),
                ElevatedButton(onPressed: () { 
                  notifyer.getPosts(1);
                  },
                  child: Text("Carregar o primeiro post")),
                ElevatedButton(onPressed: () { 
                  notifyer.deletePost(1);
                  },
                  child: Text("Deletar Post")),
                ElevatedButton(onPressed: () { 
                  notifyer.postPost(Post(id:1, title:"teste", body:"Teste", userId: 1));
                  },
                  child: Text("Postar Post")),
                  
              ],
            ),
          )
        ],
      )
    );
  }
}