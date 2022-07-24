import 'package:fetch_api_demo/post_screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case PostStatus.success:
              if (state.postList.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all((Radius.circular(25))),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.postList[index].title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all((Radius.circular(25))),
                                child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      state.postList[index].user.avatarUrl,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "User name:",
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      Text(state.postList[index].user.login)

                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ));
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
