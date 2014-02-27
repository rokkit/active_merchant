module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Universal
        class Return < ActiveMerchant::Billing::Integrations::Return

          def success?
            true
          end

        end
      end
    end
  end
end
