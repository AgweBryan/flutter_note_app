import 'package:get/get.dart';

class AddNoteController extends GetxController {
  final _isPinned = 0.obs;
  final _isFavorite = 0.obs;
  final _isArchived = 0.obs;
  final _selectedNoteColor = 0.obs;

  int get isPinned => _isPinned.value;
  int get isFavorite => _isFavorite.value;
  int get isArchived => _isArchived.value;
  int get selectedNoteColor => _selectedNoteColor.value;

  updateIsPinned() => _isPinned.value = _isPinned.value == 0 ? 1 : 0;
  updateIsFavorite() => _isFavorite.value = _isFavorite.value == 0 ? 1 : 0;
  updateIsArchived() => _isArchived.value = _isArchived.value == 0 ? 1 : 0;
  updateSelectedNoteColor(int colorIndex) {
    _selectedNoteColor.value = colorIndex;
  }
}
