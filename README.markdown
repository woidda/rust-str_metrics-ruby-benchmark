# Some Benchmarks Jaro-Winkler in plain Ruby vs Rust

I played around with rust integration and found a project called [str_metrics](https://github.com/anirbanmu/str_metrics] 
-- see [reddit](https://www.reddit.com/r/ruby/comments/fhu07l/released_a_string_metricsdistance_gem_written_in/) and 
wanted to see how fast a native Rust implementation for [Jaro-Winkler distance](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance) 
is vs the one shipped in Ruby (used for "did-you-mean" suggestion for typos in methods). 
I added the Levenshtein distance as well.

The benchmark executes 50 000 times a string comparison and prints out the result. See the `benchmark-rust.rb`.

Note: You might need to [install rust](https://www.rust-lang.org/tools/install) first for your environment if you want to run those benchmarks yourself or adapt it.

## Results

```bash
ruby benchmark-rust.rb
```

```
These report shows the user CPU time, system CPU time, the sum of the user and system CPU times, and the elapsed real time. The unit of time is seconds.
----------
Jarowinkler test short words
----------
str_metrics
  0.278842   0.000000   0.278842 (  0.278858)
ruby
  1.056634   0.003742   1.060376 (  1.061857)
----------
Jarowinkler test longer words
----------
str_metrics
  2.914134   0.000000   2.914134 (  2.914430)
ruby
 79.243360   0.000000  79.243360 ( 79.281593)
----------
----------
Levenshtein test short words
----------
str_metrics
  0.349502   0.000000   0.349502 (  0.349512)
ruby
  3.872907   0.000000   3.872907 (  3.873256)
----------
Levenshtein test longer words
----------
str_metrics
  6.272882   0.000000   6.272882 (  6.279489)
ruby
146.693731   0.027974 146.721705 (146.746541)

```
