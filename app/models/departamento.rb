class Departamento < ActiveRecord::Base

has_many :seducs


def before_save
    self.depto.upcase!
end

end
