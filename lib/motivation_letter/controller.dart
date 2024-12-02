
import 'package:flutter_riverpod/flutter_riverpod.dart';

late Provider motivationScrollControllerProvider;
final StateProvider<int> tabStateProvider = StateProvider((ref) => 1);
 StateProvider<int> offsetStateProvider = StateProvider((ref) => 0);
late Provider listViewKeyProvider;
