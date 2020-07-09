class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :volunteersNeeded
  attribute :creator do |task|
    UserSerializer.new(task.user)
  end
  attribute :helpers do |task|
    task.users.map{ |user| UserSerializer.new(user) }
  end
  attribute :volunteerData do |task|
    task.volunteers
  end

end
