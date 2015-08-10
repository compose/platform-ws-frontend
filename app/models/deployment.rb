class Deployment
  include ActiveModel::Model
  attr_accessor :id, :name, :type

  FAKES = [
    {id: "13243647586970", name: "compose-elasticsearch-test", type: "elasticsearch" },
    {id: "987654321", name: "compose-redis-test", type: "redis" }
  ]

  FAKES_BY_ID = Hash[FAKES.map{|f| [f[:id], f] }]
  FAKES_BY_NAME = Hash[FAKES.map{|f| [f[:name], f] }]
  def self.all
    FAKES.map{|f| new(f) }
  end

  def self.find(id)
    d = FAKES_BY_ID[id] || FAKES_BY_NAME[id]
    if d.nil?
      raise RecordNotFound.new("Can't find deployment", self, "id", id)
    else
      new(d)
    end
  end
end
