# Flutter Extentions Methods

Extension methods, which allow you to pretend to add new members of existing types. An extension method can be invoked just like a normal method, o.extensionMethod(42), even though it really is just a static function.

In a simple word, it will get you rid of the Utility class with lots of static methods you are creating all along.

why I need this? When you’re using someone else’s API or when you implement a library that’s widely used, it’s often impractical or impossible to change the API. But you might still want to add some functionality.

The most basic example can be:
```
int.parse('42')
```

To this:
```
42'.parseInt()
```

## Extensions for Iterables
- half
- take
- drop
- firstHalf
- secondHalf
- swap
- getRandom
- firstOrNull
- firstOrNullWhere
- firstOrDefault
- lastOrNull
- lastOrDefault
- forEachIndexed
- sortedDescending
- containsAll
- count
- distinctBy
- subtract

## Extensions for Integers
- toMilliseconds
- toSeconds
- toMinutes
- toHours
- toDays
 
## Extensions for Date Time
- addOrRemoveYears
- addOrRemoveMonth
- addOrRemoveDay
- addOrRemoveMinutes
- addOrRemoveSeconds
- startOfDay
- startOfMonth
- startOfYear
- operator to add dates
- operator to subtract dates
- tomorrow
- yesterday
- min
- max


TBD - tests

## will release soon...
- Extentions for Ranges
- Extentions for Files







