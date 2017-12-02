require "spec_helper"
require "execute"

module Codepanda
  RSpec.describe Execute do
    describe "#process" do
      subject(:process) { described_class.new(source_code).process }

      let(:fixtures_path) { File.join(File.expand_path("../../../", __FILE__), "fixtures") }
      let(:source_code) { File.read(File.join(fixtures_path, "hello_world.c")) }

      it "executes source code and returns output" do
        expect(process.output).to eq("Hello, World!")
      end

      it "returns success" do
        expect(process.success).to be_truthy
      end

      context "when source code is invalid" do
        let(:source_code) { File.read(File.join(fixtures_path, "hello_world_invalid.c")) }

        it "returns detailed error output" do
          expect(process.output).to include("character [-Werror")
        end

        it "returns success" do
          expect(process.success).to be_falsey
        end
      end
    end
  end
end
