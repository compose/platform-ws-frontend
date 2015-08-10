# Raised when Active Record cannot find record by given id or set of ids.
class RecordNotFound < StandardError
  attr_reader :model, :primary_key, :id

  def initialize(message = nil, model = nil, primary_key = nil, id = nil)
    @primary_key = primary_key
    @model = model
    @id = id

    super(message)
  end
end
