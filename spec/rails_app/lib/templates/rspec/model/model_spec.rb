require 'spec_helper'

describe <%= class_name %> do
  it 'should be valid' do
    <%= table_name %>(:one).should be_valid
  end
end
