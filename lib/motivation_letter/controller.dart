
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late Provider<ScrollController> motivationScrollControllerProvider;
final StateProvider<int> tabStateProvider = StateProvider((ref) => 1);
 StateProvider<int> offsetStateProvider = StateProvider((ref) => 0);
late Provider listViewKeyProvider;
