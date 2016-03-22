require 'spec_helper'
require 'rails_helper'

describe Case do
  it 'is invalid without a client' do
    law_case = Case.new
    expect(law_case).to be_invalid
  end
end