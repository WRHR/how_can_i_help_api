class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :volunteersNeeded
  attribute :user do |task|
    UserSerializer.new(task.user)
  end
  attribute :helpers do |task|
    task.users.map{ |user| UserSerializer.new(user) }
  end
end
