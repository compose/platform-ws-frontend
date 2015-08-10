class Deployment
  include ActiveModel::Model
  attr_accessor :id, :name, :type

  FAKES = [
    {id: "13243647586970", name: "compose-elasticsearch-test", type: "elasticsearch" },
    {id: "987654321", name: "compose-redis-test", type: "redis" }
  ]
  def self.all
    FAKES.map{|f| new(f) }
  end
end
