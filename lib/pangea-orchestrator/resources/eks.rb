# lib/pangea-orchestrator/resources/eks.rb
require 'json'
require 'terraform-synthesizer'

module PangeaOrchestrator
  module Resources
    class EKS
      class << self
        def symbolize(hash)
          JSON[JSON[hash, symbolize_name: true]]
        end

        def cluster(name:, resource_name: nil)
          resource_name = name if resource_name.nil?
          resource :aws_eks_cluster, resource_name do
            name name
          end
        end
      end
    end
  end
end
