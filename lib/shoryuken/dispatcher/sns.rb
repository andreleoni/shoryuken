module Shoryuken::Dispatcher
  module Sns
    def self.included(base)
      base.include(Shoryuken::Worker)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def perform(sns_params)
        # key_value = sns_params.dig(:MessageAttributes, dispacher_options[:key], :Value) # service
        # dispacher_config = dispachers[key_value]
        # worker_params = sns_params[:subset]

        # call_dispacher(dispacher_config, worker_params) if dispacher_config
      end

      private

      def call_dispacher(dispacher_config, worker_params)
        # if dispacher_config[:async]
        #   dispacher_config[:to].perform_async(worker_params)
        # else
        #   dispacher_config[:to].new.perform(worker_params)
        # end
      end
    end
  end
end
