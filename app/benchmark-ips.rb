require_relative 'graphql_helpers'
require_relative 'gc_helpers'

def run
  Benchmark.ips do |x|
    x.config(
      warmup: 3,
      iterations: 5,
      suite: GCSuite.new
    )

    x.report('preload') do
      PreloadExecutor.new.run
    end

    x.report('batch loader') do
      BatchLoaderExecutor.new.run
    end

    x.report('graphql batch') do
      GraphqlBatchExecutor.new.run
    end

    x.compare!
  end
end

run
