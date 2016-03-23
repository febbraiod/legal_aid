require 'spec_helper'
require 'rails_helper'

attr_array = [:first_name, :last_name, :home_phone, :work_phone, :cell_phone, :email, :address, :city, :state, :zip]

describe Client do
  it 'responds to intended attributes' do
    attr_array.each do |a|
      expect(subject).to respond_to(a)
    end
  end
end
#trying to keep this DRY but not sure if this is how one should do this. maybe ask at assessment?