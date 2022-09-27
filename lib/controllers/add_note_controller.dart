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

  // Get boolean values
  bool get isPinnedBool => isPinned == 0 ? false : true;
  bool get isArchivedBool => isArchived == 0 ? false : true;
  bool get isFavoriteBool => isFavorite == 0 ? false : true;

  updateIsPinned(bool val) => _isPinned.value = val == true ? 1 : 0;
  updateIsFavorite(bool val) => _isFavorite.value = val == true ? 1 : 0;
  updateIsArchived(bool val) => _isArchived.value = val == true ? 1 : 0;
  updateSelectedNoteColor(int colorIndex) {
    _selectedNoteColor.value = colorIndex;
  }
}
