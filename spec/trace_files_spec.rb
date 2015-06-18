require_relative 'spec_helper'

describe 'trace_files' do
  attr_reader :example_trace, :capture

  before do
    @example_trace = File.expand_path File.join __dir__, 'example_trace.rb'
    @capture       = StringIO.new
  end

  it 'traces correctly with color' do
    TraceFiles.set trace: [example_trace], io: capture
    ExampleTrace.run

    actual = capture.string
    expect(actual).to eq(expected_colors)
  end

  it 'traces correctly without color' do
    TraceFiles.set trace: [example_trace], io: capture, color: ''
    ExampleTrace.run

    actual = capture.string
    expect(actual).to eq(expected_no_colors)
  end
end
