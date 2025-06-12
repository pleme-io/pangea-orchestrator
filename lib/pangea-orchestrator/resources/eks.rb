# lib/pangea-orchestrator/resources/eks.rb
require 'json'
module PangeaOrchestrator
  module Resources
    class EKS
      class << self
        def symbolize(hash)
          JSON[JSON[hash, symbolic_names: true]]
        end

        def cluster(*_args, **kwargs)
          kwargs        = symbolize(kwargs)
          resource_name = kwargs[:resource_name]
          name          = kwargs[:name]
          resource :aws_eks_cluster, resource_name do
            name name
          end
        end
      end
    end
  end
end
