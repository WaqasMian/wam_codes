require 'rails_helper'

RSpec.describe Dish, type: :model do
    describe "model-validations" do
        describe "validates presence of field" do
            it { is_expected.to validate_presence_of(:name)}
        end

        describe "validates price field as integer" do
            it {should validate_numericality_of(:price).only_integer}
        end

        describe "validates visits field as integer" do
            it {should validate_numericality_of(:visits).only_integer}
        end
    end

end 