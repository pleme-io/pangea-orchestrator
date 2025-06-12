# lib/pangea-orchestrator/resources/eks.rb
require 'json'
require 'terraform-synthesizer'

module PangeaOrchestrator
  module Resources
    class EKS
      class << self
        def synthesizer
          @synthesizer ||= TerraformSynthesizer.new
        end

        def symbolize(hash)
          JSON[JSON[hash, symbolize_name: true]]
        end

        def cluster(*_args, **kwargs)
          kwargs        = symbolize(kwargs)
          resource_name = kwargs[:resource_name]
          name          = kwargs[:name]

          resource_name = name if resource_name.nil?

          synthesizer.synthesize do
            resource :aws_eks_cluster, resource_name do
              name name
            end
          end
        end
      end
    end
  end
end
