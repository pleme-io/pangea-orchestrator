# lib/pangea-orchestrator/resources/eks.rb
def eks(name:, resource_name: nil)
  resource_name = name if resource_name.nil?
  resource :aws_eks_cluster, resource_name do
    name name
  end
end
