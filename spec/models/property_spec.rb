require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should have_many(:departments) }
  it { should respond_to(:name) }

end
