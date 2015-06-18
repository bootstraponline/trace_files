require 'trace_files/version'

module TraceFiles
  ##
  # Trace file source to :io (default $stdout)
  #
  # spec_opts = {}
  #
  # @param :trace [Array<String>] the files to trace
  # @param :io [IO] io to print to
  # @return [TracePoint] the trace point object
  def self.set spec_opts
    targets   = []
    files     = {}
    last_file = ''
    last_line = -1

    files_to_trace = spec_opts.fetch(:trace, []);
    io    = spec_opts.fetch(:io, $stdout)
    color = spec_opts.fetch(:color, "\e[32m") # ANSI.green default
    # target only existing readable files
    files_to_trace.each do |f|
      if File.exists?(f) && File.readable?(f)
        targets.push File.expand_path f
        targets.push File.basename f # sometimes the file is relative
      end
    end
    return if targets.empty?

    trace_point = TracePoint.new do |trace|
      file_path = trace.path
      if targets.include?(file_path)
        line_number = trace.lineno
        # never repeat a line
        unless file_path == last_file && line_number == last_line
          file_sym        = file_path.intern
          files[file_sym] = IO.readlines(file_path) if files[file_sym].nil?
          lines           = files[file_sym]

          # arrays are 0 indexed and line numbers start at one.
          io.print color if color # ANSI code
          io.puts lines[line_number - 1]
          io.print "\e[0m" if color # ANSI.clear

          last_file = file_path
          last_line = line_number
        end
      end
    end

    trace_point.enable
    trace_point
  end
end
