require 'spec_helper'

describe Book do
  describe "validations" do
    it { should validate_presence_of :buy_link }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe "associations" do
    it {should have_many :topics}
end
