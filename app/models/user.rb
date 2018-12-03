class User
  include Mongoid::Document
  field :username, type: String
  field :name, type: String
  field :projects, type: Array, default: []

  def projects_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  def projects_list
    self.tags.join(', ')
  end
end
