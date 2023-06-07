import 'dart:async';
import 'package:melvingpt/config.dart';

// ignore: avoid_classes_with_only_static_members
/// A store of consumable items.
///
/// This is a development prototype tha stores consumables in the shared
/// preferences. Do not use this in real world apps.
class ConsumableStore {
  static const String _kPrefKey = 'consumables';
  static Future<void> _writes = Future<void>.value();

  /// Adds a consumable with ID `id` to the store.
  ///
  /// The consumable is only added after the returned Future is complete.
  static Future<void> save(String id) {
    _writes = _writes.then((void _) => _doSave(id));
    return _writes;
  }

  /// Consumes a consumable with ID `id` from the store.
  ///
  /// The consumable was only consumed after the returned Future is complete.
  static Future<void> consume(String id) {
    _writes = _writes.then((void _) => _doConsume(id));
    return _writes;
  }

  /// Returns the list of consumables from the store.
  static Future<List<String>> load() async {
    /*return (await SharedPreferences.getInstance()).getStringList(_kPrefKey) ??
        <String>[];*/
    return appCtrl.storage.read(_kPrefKey) ?? <String>[];
  }

  static Future<void> _doSave(String id) async {
    final List<String> cached = await load();

    cached.add(id);
    await appCtrl.storage.write(_kPrefKey, cached);
  }

  static Future<void> _doConsume(String id) async {
    final List<String> cached = await load();
    cached.remove(id);
    await appCtrl.storage.write(_kPrefKey, cached);
  }
}