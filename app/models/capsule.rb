class Capsule
  include ActiveModel::Model
  attr_accessor :id, :name, :deployment_id

  FAKES = [
    {id: "111111", name: "redis0", deployment_id: "987654321"}
  ]

  FAKES_BY_ID = Hash[FAKES.map{|f| [f[:id], f] }]
  FAKES_BY_DEPLOYMENT_ID = Hash[FAKES.map{|f| [f[:slug], f] }]
  def self.all
    FAKES.map{|f| new(f) }
  end

  def self.find(id)
    d = FAKES_BY_ID[id]
    if d.nil?
      raise RecordNotFound.new("Can't find capsule", self, "id", id)
    else
      new(d)
    end
  end

  def self.find_by_deployment_id(id)
    d = FAKES_BY_ID[id]
    if d.nil?
      raise RecordNotFound.new("Can't find capsule", self, "id", id)
    else
      new(d)
    end
  end

end
