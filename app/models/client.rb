class Client < ActiveRecord::Base
  include FormHelper

  has_many :cases

  def fullname
    name = ("#{self.first_name} #{self.last_name}").strip
    if !self.company_name.blank?
      name += " - #{company_name}"
    end
    name
  end

  def phones
    phone_numbers = ""
    if !self.home_phone.blank?
      phone_numbers << "  #{self.home_phone}(h) |"
    end
    if !self.work_phone.blank?
      phone_numbers << "  #{self.work_phone}(w) |"
    end
    if !self.cell_phone.blank?
      phone_numbers << "  #{self.cell_phone}(c)"
    end
    phone_numbers.chomp!(" |")
    phone_numbers.strip
  end

end
