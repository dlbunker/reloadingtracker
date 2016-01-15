class Load < ActiveRecord::Base
  validates_presence_of :name, :user
  belongs_to :user
  belongs_to :caliber
  belongs_to :primer, :class_name => Trait
  belongs_to :bullet, :class_name => Trait
  belongs_to :powder, :class_name => Trait

# def load_date=(arg)
#   if !arg.nil?
#     if arg.is_a?(String)
#       self[:load_date] = DateTime.strptime(arg, "%m-%d-%Y")
#     else #just push it through
#       self[:load_date] = arg
#     end
#   end
# end
end
