import 'package:get/get.dart';

class AddNoteController extends GetxController {
  final _isPinned = false.obs;
  final _isFavorite = false.obs;
  final _isArchived = false.obs;

  bool get isPinned => _isPinned.value;
  bool get isFavorite => _isFavorite.value;
  bool get isArchived => _isArchived.value;

  updateIsPinned() => _isPinned.value = !_isPinned.value;
  updateIsFavorite() => _isFavorite.value = !_isFavorite.value;
  updateIsArchived() => _isArchived.value = !_isArchived.value;
}
