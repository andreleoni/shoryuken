module Shoryuken::Dispatcher
  module Sns
    def self.included(base)
      base.include(Shoryuken::Worker)
      # base.extend(ClassMethods)
    end

    module ClassMethods
    end
  end
end
