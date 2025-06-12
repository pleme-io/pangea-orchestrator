# lib/pangea-orchestrator/resources/eks.rb
def eks(
  name:,
  resource_name: nil,
  version: '1.31',
  access_config: {authentication_mode: :API},
  vpc_config: {},
  bootstrap_self_managed_addons: false
  compute_config: {}
  kubernetes_network_config: {}
  storage_config: {}

)
  resource_name = name if resource_name.nil?
  resource :aws_eks_cluster, resource_name do
    name name
  end
end
