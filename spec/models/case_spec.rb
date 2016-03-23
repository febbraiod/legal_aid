require 'spec_helper'
require 'rails_helper'

describe Case do
  it 'is invalid without a client' do
    expect(subject).to be_invalid
  end

  it 'is valid with a client' do
    subject.client = Client.new
    expect(subject).to be_valid
  end
end