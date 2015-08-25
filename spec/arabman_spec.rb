require 'spec_helper'

describe Arabman do
  it 'has a version number' do
    expect(Arabman::VERSION).not_to be nil
  end

  it 'to_roman correctly' do
    expect(460.to_roman).to eq('CDLX')
    expect(3999.to_roman).to eq('MMMCMXCIX')
  end

  it 'return errors' do
    # TODO: Add test
    # expect { 0.to_roman }.to raise_error(RangeError, "Please enter a number between 1 and 3999.")
    # expect { 4000.to_roman }.to raise_error(RangeError, "Please enter a number between 1 and 3999.")
  end
end
