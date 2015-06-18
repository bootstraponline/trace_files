# TraceFiles [![Gem Version](https://badge.fury.io/rb/trace_files.svg)](http://badge.fury.io/rb/trace_files) [![Dependency Status](https://gemnasium.com/bootstraponline/trace_files.svg)](https://gemnasium.com/bootstraponline/trace_files) [![Build Status](https://travis-ci.org/bootstraponline/trace_files.svg?branch=master)](https://travis-ci.org/bootstraponline/trace_files/builds)

Gem for tracing Ruby files.

```ruby
require 'trace_files'

TraceFiles.set trace: [__FILE__]
```

Glob example.

```ruby
require 'trace_files'

targets = Dir.glob(File.join(__dir__, '../lib/**/*.rb'))
targets.map! { |t| File.expand_path t }
puts "Tracing: #{targets}"

TraceFiles.set trace: targets
```

The `TraceFiles.set` method returns a [TracePoint](http://ruby-doc.org/core-2.2.2/TracePoint.html)
object.

```ruby
trace_point = TraceFiles.set trace: [__FILE__], color: false
trace_point.disable
trace_point.enable
trace_point.enabled?
```
