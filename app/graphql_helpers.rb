class BaseExecutor
  def run
    GraphqlExampleSchema.execute(query_string, context:)
  end

  private

  def context
    { current_user: User.first }
  end

  def query_string
    raise NotImplementedError
  end
end

class PreloadExecutor < BaseExecutor
  private

  def query_string
    %(
      query {
        viewer {
          feedWithPreload {
            author {
              nickname
            }
            content
          }
        }
      }
    )
  end
end

class GraphqlBatchExecutor < BaseExecutor
  private

  def query_string
    %(
      query {
        viewer {
          feed {
            authorGraphqlBatch {
              nickname
            }
            content
          }
        }
      }
    )
  end
end

class BatchLoaderExecutor < BaseExecutor
  private

  def query_string
    %(
      query {
        viewer {
          feed {
            authorBatchLoader {
              nickname
            }
            content
          }
        }
      }
    )
  end
end
