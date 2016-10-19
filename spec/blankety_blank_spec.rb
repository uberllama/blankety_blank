require 'spec_helper'

describe BlanketyBlank do
  it 'has a version number' do
    expect(BlanketyBlank::VERSION).not_to be nil
  end

  describe '.nilifiable_attributes' do
    it 'sets base class nilifiable_attributes' do
      expect(Company.nilifiable_attributes).to eq([:name, :phone])
    end

    it 'sets sub class nilifiable_attributes from base class' do
      expect(Vendor.nilifiable_attributes).to eq(Company.nilifiable_attributes)
    end
  end

  describe '#before_validation' do
    let(:nilifiable_model) { Vendor.new(name: "Foo", description: " ", phone: " ") }

    before(:each) do
      nilifiable_model.validate
    end

    it 'preserves designated attributes that were not empty' do
      expect(nilifiable_model.name).to eq("Foo")
    end

    it 'nilifies designated attributes that were empty' do
      expect(nilifiable_model.phone).to be_nil
    end

    it 'does not modify undesignated attributes' do
      expect(nilifiable_model.description).to eq(" ")
    end
  end
end
