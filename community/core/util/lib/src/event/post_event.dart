import 'dart:async';

/// 글 작성 완료 이벤트를 관리하는 글로벌 스트림
class PostEventBus {
  static final PostEventBus _instance = PostEventBus._internal();
  factory PostEventBus() => _instance;
  PostEventBus._internal();

  final StreamController<PostEvent> _eventController = StreamController<PostEvent>.broadcast();

  /// 이벤트 스트림
  Stream<PostEvent> get eventStream => _eventController.stream;

  /// 이벤트 발송
  void emit(PostEvent event) {
    _eventController.add(event);
  }

  /// 리소스 정리
  void dispose() {
    _eventController.close();
  }
}

/// 포스트 관련 이벤트
abstract class PostEvent {}

/// 글 작성 완료 이벤트
class PostCreatedEvent extends PostEvent {
  PostCreatedEvent();
}

/// 글 수정 완료 이벤트
class PostUpdatedEvent extends PostEvent {
  PostUpdatedEvent();
}

/// 글 삭제 완료 이벤트
class PostDeletedEvent extends PostEvent {
  PostDeletedEvent();
}
