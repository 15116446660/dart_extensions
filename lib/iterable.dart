import 'dart:collection';

extension CollectionsExt<T> on Iterable<T> {
  /// get the first element return null
  T get firstOrNull => elementAtOrNull(0);

  T firstOrNullWhere(bool predicate(T element)) {
    return firstWhere(predicate, orElse: () => null);
  }

  /// get the last element if the list is not empty or return null
  T get lastOrNull => isNotEmpty ? last : null;

  T lastOrDefault(T defaultValue) => lastOrNull ?? defaultValue;

  /// get the first element or provider default
  /// example:
  /// var name = [danny, ronny, idan].firstOrDefault["nuni"]; // danny
  /// var name = [].firstOrDefault["nuni"]; // nuni
  T firstOrDefault(T defaultValue) => firstOrNull ?? defaultValue;

  // get an element at specific index or return null
  T elementAtOrNull(int index) {
    return _elementOrNull(index, (_) => null);
  }

  /// forEach with an index on collections, will provide [index] and [element] for every iteration,
  /// example:
  /// ["a","b","c"].forEachIndexed((item, index) {
  ///    print("$item, $index");
  ///  });
  /// result:
  /// a, 0
  /// b, 1
  /// c, 2
  void forEachIndexed(void action(T element, int index)) {
    var index = 0;
    for (var element in this) {
      action(element, index++);
    }
  }

  /// Returns a new list with all elements sorted according to descending
  /// natural sort order.
  List<T> sortedDescending() {
    var list = toList();
    list.sort((a, b) => -(a as Comparable).compareTo(b));
    return list;
  }

  /// Checks if all elements in the specified [collection] are contained in
  /// this collection.
  bool containsAll(Iterable<T> collection) {
    for (var element in collection) {
      if (!contains(element)) return false;
    }
    return true;
  }

  /// Return a number of the existing elements by a specific predicate
  /// example:
  ///  final aboveTwenty = [
  ///    User(33, "chicko"),
  ///    User(45, "ronit"),
  ///    User(19, "amsalam"),
  ///  ].count((user) => user.age > 20); // 2
  int count([bool predicate(T element)]) {
    var count = 0;
    if (predicate == null) {
      return length;
    } else {
      for (var current in this) {
        if (predicate(current)) {
          count++;
        }
      }
    }

    return count;
  }

  /// Returns a list containing only the elements from given collection having distinct keys.
  ///
  /// Basically it's just like distinct function but with a predicate
  /// example:
  /// [
  ///    User(22, "Sasha"),
  ///    User(23, "Mika"),
  ///    User(23, "Miryam"),
  ///    User(30, "Josh"),
  ///    User(36, "Ran"),
  ///  ].distinctBy((u) => u.age).forEach((user) {
  ///    print("${user.age} ${user.name}");
  ///  });
  ///
  /// result:
  /// 22 Sasha
  /// 23 Mika
  /// 30 Josh
  /// 36 Ran
  List<T> distinctBy(predicate(T selector)) {
    final set = HashSet();
    final list = List<T>();
    for (var item in this) {
      final key = predicate(item);
      if (set.add(key)) {
        list.add(item);
      }
    }

    return list;
  }

  _elementOrNull(int index, T defaultElement(int index)) {
    // if our index is smaller then 0 return the default
    if (index < 0) return defaultElement(index);

    var counter = 0;
    for (var element in this) {
      if (index == counter++) {
        return element;
      }
    }

    return defaultElement(index);
  }
}