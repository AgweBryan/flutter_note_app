import 'package:flutter_note_app/views/screens/notes/views_enum.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesController extends GetxController {
  final _views = Views.grid.obs;

  final String _key = 'SelectedView';

  Views get views => _views.value;

  String displayedView() {
    switch (views) {
      case Views.detailed:
        return 'detailed';
      case Views.staggered:
        return 'staggered';
      case Views.grid:
        return 'grid';
      case Views.largeGrid:
        return 'large-grid';
      case Views.list:
        return 'list';
    }
  }

  @override
  void onInit() {
    super.onInit();
    getdisplayedView();
  }

  Future<bool> storeSelectedView() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_key, displayedView());
  }

  getdisplayedView() async {
    final prefs = await SharedPreferences.getInstance();

    final response = prefs.getString(_key);

    selectedView(response ?? 'grid');
  }

  void selectedView(String? value) async {
    switch (value) {
      case 'detailed':
        _views.value = Views.detailed;
        break;
      case 'list':
        _views.value = Views.list;
        break;
      case 'staggered':
        _views.value = Views.staggered;
        break;
      case 'grid':
        _views.value = Views.grid;
        break;
      case 'large-grid':
        _views.value = Views.largeGrid;
        break;
    }
    await storeSelectedView();
  }
}
