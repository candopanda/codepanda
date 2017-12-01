require "tempfile"
require "open3"
require "securerandom"

module Codepanda
  class Execute
    COMPILER_PATH = File.expand_path("../../../scripts/compile_wrapper", __FILE__)
    RESULT = Struct.new(:output, :success)

    attr_reader :file
    private :file

    def initialize(source_code)
      @file = Tempfile.new(["source_code", ".c"])
      @file.write(source_code)
      @file.rewind
    end

    def process
      result = RESULT.new

      Open3.popen2e("sh -c '#{COMPILER_PATH} #{file.path} #{SecureRandom.uuid}'") do |_stdin, stdout, wait_thr|
        result.output = stdout.read
        result.success = wait_thr.value.success?
      end

      result
    ensure
      file.close!
    end
  end
end
