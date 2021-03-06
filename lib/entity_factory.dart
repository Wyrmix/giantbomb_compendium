import 'package:flappy_bombs/data/video/video_categories_result_entity.dart';
import 'package:flappy_bombs/data/video/video_details_entity.dart';
import 'package:flappy_bombs/data/video/video_entity.dart';
import 'package:flappy_bombs/data/video/video_shows_result_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "VideoCategoriesResultEntity") {
      return VideoCategoriesResultEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoDetailsEntity") {
      return VideoDetailsEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoEntity") {
      return VideoEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoShowsResultEntity") {
      return VideoShowsResultEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}