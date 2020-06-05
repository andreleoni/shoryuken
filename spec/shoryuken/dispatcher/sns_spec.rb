require 'spec_helper'
require 'shared_examples_for_shoryuken_worker'

RSpec.describe Shoryuken::Dispatcher::Sns do
  it_behaves_like 'shoryuken_worker'
end
