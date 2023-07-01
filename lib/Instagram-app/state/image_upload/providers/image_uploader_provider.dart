import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/image_upload/notifiers/image_upload_notifier.dart';
import 'package:riverpod_project/Instagram-app/state/image_upload/typedefs/is_loading.dart';

final imagUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, IsLoading>(
        (ref) => ImageUploadNotifier());
