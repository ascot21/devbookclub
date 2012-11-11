require 'spec_helper'

describe Topic do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :body}
  end
  describe "associations" do
    it {should belong_to :book}
  end
end
