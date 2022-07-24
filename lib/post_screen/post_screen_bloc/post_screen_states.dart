part of 'post_screen_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState {
  const PostState({this.status = PostStatus.initial, this.postList = const <ApiDataModel>[]});

  final PostStatus status;
  final List<ApiDataModel> postList;

  PostState copyWith({
    PostStatus? status,
    List<ApiDataModel>? postList,
  }) {
    return PostState(status: status ?? this.status, postList: postList ?? this.postList);
  }
}
