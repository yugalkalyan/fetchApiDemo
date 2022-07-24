import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import '../post_screen.dart';

part 'post_screen_events.dart';

part 'post_screen_states.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }
  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {

    try {
      if (state.status == PostStatus.initial) {
        final data = await _fetchPosts();

        return emit(state.copyWith(
          status: PostStatus.success,
          postList: data,

        ));
      }




    } catch (e) {
      print(e);
      emit(state.copyWith(status: PostStatus.failure));
    }
  }


  Future<List<ApiDataModel>> _fetchPosts() async {
    final response =  await http.get(Uri.parse("https://api.github.com/repos/facebook/react/issues"));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      List<ApiDataModel>post = body
          .map((e) => ApiDataModel.fromJson(e)).toList();
    return post;
    }
    throw Exception('error fetching posts');
  }

}
