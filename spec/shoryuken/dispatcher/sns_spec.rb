require 'spec_helper'
require 'shared_examples_for_shoryuken_worker'

RSpec.describe Shoryuken::Dispatcher::Sns do
  it_behaves_like 'shoryuken_worker'

  describe '.shoryuken_dispatcher_options' do
    it 'registers a worker' do
      expect(Shoryuken.worker_registry.workers('default')).to eq([TestWorker])
    end

    it 'accepts a block as a queue' do
      eval("class NewTestWorker
        include #{described_class}

        shoryuken_dispatcher_options queue: :messages, key: :testkey

        dispach 'create', to: ShipmentCreateWorker, async: true
        dispach 'destroy', to: ShipmentDestroyWorker, async: false
      end")

      expect(Shoryuken.worker_registry.workers('production_default')).to eq([NewTestWorker])
      expect(NewTestWorker.get_shoryuken_options['queue']).to eq 'production_default'
    end
  end
end
