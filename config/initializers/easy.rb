class ActiveRecord::Base

  def self.sample
    offset(rand(0...count)).first
  end

  def self.[](id)
    self.find_by(id: id)
  end

end
