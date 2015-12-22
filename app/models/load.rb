class Load < ActiveRecord::Base

  def load_date=(arg)
    if !arg.nil?
      if arg.is_a?(String)
        self[:load_date] = DateTime.strptime(arg, "%m-%d-%Y")
      else #just push it through
        self[:load_date] = arg
      end
    end
  end
end
