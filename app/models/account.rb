class Account
  include ActiveModel::Model
  attr_accessor :id, :name, :slug

  FAKES = [
    {id: "123456789", name: "Worksample Account", slug: "worksample"}
  ]

  FAKES_BY_ID = Hash[FAKES.map{|f| [f[:id], f] }]
  FAKES_BY_SLUG = Hash[FAKES.map{|f| [f[:slug], f] }]
  def self.all
    FAKES.map{|f| new(f) }
  end

  def self.find(id)
    d = FAKES_BY_ID[id] || FAKES_BY_SLUG[id]
    if d.nil?
      raise RecordNotFound.new("Can't find account", self, "id", id)
    else
      new(d)
    end
  end
end
