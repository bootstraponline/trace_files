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
    TraceFiles.set trace: [example_trace], io: capture, color: false
    ExampleTrace.run

    actual = capture.string
    expect(actual).to eq(expected_no_colors)
  end

  it 'returns a tracepoint object' do
    obj = TraceFiles.set trace: [example_trace]

    actual_class = obj.class
    expected_class = TracePoint
    expect(actual_class).to eq(expected_class)

    # that defaults to enabled
    expect(obj.enabled?).to eq(true)

    # and can be disabled
    obj.disable
    expect(obj.enabled?).to eq(false)

    # and enabled
    obj.enable
    expect(obj.enabled?).to eq(true)
  end
end
