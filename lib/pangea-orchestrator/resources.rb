# lib/pangea-orchestrator/resources.rb
module PangeaOrchestrator
  module Resources
    autoload :EKS, File.join(__dir__, 'resources', 'eks')
    # autoload :NOMAD, File.join(__dir__, 'resources', 'nomad')
    # autoload :NIX, File.join(__dir__, 'resources', 'nix')
  end
end
