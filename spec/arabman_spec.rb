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
    expect { 0.to_roman }.to raise_error RangeError
    expect { 4000.to_roman }.to raise_error RangeError
  end
end
