require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Universal
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          def acknowledge(authcode = nil)
            @params.delete('x-signature') == generate_signature
          end

          def item_id
            @params['x-reference']
          end

          def currency
            @params['x-currency']
          end

          def gross
            @params['x-amount']
          end

          def transaction_id
            @params['x-gateway-reference']
          end

          def status
            @params['x-result']
          end

          def test?
            @params['x-test'] == 'true'
          end

          private
          def generate_signature
            Universal.sign(@params, @options[:credential2])
          end

        end
      end
    end
  end
end
