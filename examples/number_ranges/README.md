# Number ranges

Group consecutive integer values for a compact display. The library accepts an enumerable of integers, ignores duplicates and orders the result by value. It leaves the input in its original order.

```ruby
require_relative "number_ranges"

NumberRanges.runs([9, 3, 2, 9, 1, 7])
# => [1..3, 7..7, 9..9]

NumberRanges.format([-2, 1, -1, 0, 5, 7, 8])
# => "-2..1, 5, 7..8"
```

An empty input produces an empty array of ranges or an empty display string. A non-integer value raises `ArgumentError`. Numeric strings and floating point values require an explicit conversion by the caller.

Run the examples with `ruby examples/number_ranges/test_number_ranges.rb` from the repository root.
