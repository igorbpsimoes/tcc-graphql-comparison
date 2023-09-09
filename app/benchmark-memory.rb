require_relative 'graphql_helpers'
require_relative 'gc_helpers'

class Bench
  def run
    run_bench(:preload)
    run_bench(:graphql_batch)
    run_bench(:batch_loader)
  end

  private

  def run_bench(label)
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
      pp label
      MemoryProfiler.report do
        executor.run
      end.pretty_print(scale_bytes: true, detailed_report: false)
    end
  end
end

Bench.new.run
