require 'rails_helper'

RSpec.describe Menu, type: :model do
    describe "model-validations" do
        describe "validates presence of field" do
            it { is_expected.to validate_presence_of(:name)}

            describe "validates length of field " do
                it { should validate_length_of(:name).is_at_least(4) }
            end
        end
    end
end 