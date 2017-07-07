require 'rails_helper'

RSpec.describe Department, type: :model do
  it { should belong_to(:property) }
  it { should respond_to(:name) }
end
