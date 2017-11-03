module Clusters
  module Applications
    class Helm < ActiveRecord::Base
      self.table_name = 'clusters_applications_helm'

      NAME = 'helm'.freeze

      include ::Clusters::Concerns::ApplicationStatus

      belongs_to :cluster, class_name: 'Clusters::Cluster', foreign_key: :cluster_id

      default_value_for :version, Gitlab::Kubernetes::Helm::HELM_VERSION

      validates :cluster, presence: true

      def name
        NAME
      end
    end
  end
end
