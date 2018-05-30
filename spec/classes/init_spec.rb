require 'spec_helper'
describe 'basesystem' do
  context 'with default values for all parameters' do
    it { should contain_class('basesystem') }
  end
end
