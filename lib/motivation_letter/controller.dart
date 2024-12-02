
import 'package:flutter_riverpod/flutter_riverpod.dart';

late Provider motivationScrollControllerProvider;
final StateProvider<int> tabStateProvider = StateProvider((ref) => 1);
late StateProvider<int> offsetStateProvider = StateProvider((ref) => 0);
