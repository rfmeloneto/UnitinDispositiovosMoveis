import 'package:flutter/material.dart';
import 'package:primeiro_app/domain/post_entity.dart';
import 'package:primeiro_app/presenter/store_post.dart';

class PostPage extends StatefulWidget {
  final StorePost store = StorePost();
  PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void dispose() {
    super.dispose();
    widget.store.postNotifyer.dispose();
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
              listenable: widget.store.postNotifyer,
              builder: (context, child) {
                if(widget.store.postNotifyer.isLoading){
                    return Center(child: CircularProgressIndicator());
                  }
                if(widget.store.postNotifyer.posts.isEmpty){
                  return Center(child: Text(widget.store.postNotifyer.message));
                }
                return ListView.builder(
                itemCount: widget.store.postNotifyer.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8.0,
                    color: Colors.grey.shade400,
                    child: ListTile(
                      title: Text(widget.store.postNotifyer.posts[index].title),
                      subtitle: Text(widget.store.postNotifyer.posts[index].body),
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
                  widget.store.postNotifyer.getPosts(null);
                  
                  },
                  child: Text("Carregar posts")),
                ElevatedButton(onPressed: () { 
                  widget.store.postNotifyer.getPosts(1);
                  },
                  child: Text("Carregar o primeiro post")),
                ElevatedButton(onPressed: () { 
                  widget.store.postNotifyer.deletePost(1);
                  },
                  child: Text("Deletar Post")),
                ElevatedButton(onPressed: () { 
                  widget.store.postNotifyer.postPost(Post(id:1, title:"teste", body:"Teste", userId: 1));
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