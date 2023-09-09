require_relative 'graphql_helpers'
require_relative 'gc_helpers'

class Bench
  def run
    Benchmark.bm(15) do |x|
      run_bench(x, :preload)
      run_bench(x, :graphql_batch)
      run_bench(x, :batch_loader)
    end
  end

  private

  def run_bench(x, label)
    executor = nil

    case label
    when :preload
      executor = PreloadExecutor.new
    when :graphql_batch
      executor = GraphqlBatchExecutor.new
    when :batch_loader
      executor = BatchLoaderExecutor.new
    end

    without_gc do
      x.report(label) do
        executor.run
      end
    end
  end
end

Bench.new.run
