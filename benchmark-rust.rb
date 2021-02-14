# frozen_string_literal: true

require 'benchmark'
require 'str_metrics'

tests = [
  %w[München Munich],
  %w[Berlin Munich],
  ['Some rather long string', 'Another rather long string']
]
long_words_tests = [
  ["The Jaro–Winkler distance uses a prefix scale p which gives more favourable ratings to strings that match from the beginning for a set prefix length ll ll .", "Another rather long string"],
  ["The Jaro–Winkler distance uses a prefix scale p which gives more favourable ratings to strings that match from the beginning for a set prefix length ll ll .", "This report shows the user CPU time, system CPU time, the sum of the user and system CPU times, and the elapsed real time. The unit of time is seconds."]
]

puts 'These report shows the user CPU time, system CPU time, the sum of the user and system CPU times, and the elapsed real time. The unit of time is seconds.'
puts '-' * 10
puts 'Jarowinkler test short words'
puts '-' * 10
puts 'str_metrics'
puts Benchmark.measure {
  50_000.times do
    tests.each do |words|
      StrMetrics::JaroWinkler.distance(words[0], words[1])
    end
  end
}
puts 'ruby'
puts Benchmark.measure {
  50_000.times do
    tests.each do |words|
      DidYouMean::JaroWinkler.distance(words[0], words[1])
    end
  end
}
puts '-' * 10

puts 'Jarowinkler test longer words'
puts '-' * 10
puts 'str_metrics'
puts Benchmark.measure {
  50_000.times do
    long_words_tests.each do |words|
      StrMetrics::JaroWinkler.distance(words[0], words[1])
    end
  end
}
puts 'ruby'
puts Benchmark.measure {
  50_000.times do
    long_words_tests.each do |words|
      DidYouMean::JaroWinkler.distance(words[0], words[1])
    end
  end
}
puts '-' * 10


puts '-' * 10
puts 'Levenshtein test short words'
puts '-' * 10
puts 'str_metrics'
puts Benchmark.measure {
  50_000.times do
    tests.each do |words|
      StrMetrics::Levenshtein.distance(words[0], words[1])
    end
  end
}
puts 'ruby'
puts Benchmark.measure {
  50_000.times do
    tests.each do |words|
      DidYouMean::Levenshtein.distance(words[0], words[1])
    end
  end
}
puts '-' * 10

puts 'Levenshtein test longer words'
puts '-' * 10
puts 'str_metrics'
puts Benchmark.measure {
  50_000.times do
    long_words_tests.each do |words|
      StrMetrics::Levenshtein.distance(words[0], words[1])
    end
  end
}
puts 'ruby'
puts Benchmark.measure {
  50_000.times do
    long_words_tests.each do |words|
      DidYouMean::Levenshtein.distance(words[0], words[1])
    end
  end
}
puts '-' * 10



