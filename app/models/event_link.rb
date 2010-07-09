class EventLink < ActiveRecord::Base
  belongs_to :event
  belongs_to :resource
  attr_accessor :should_destroy

  def should_destroy?
    should_destroy.to_i == 1
  end
end
