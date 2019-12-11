module QuickBooks
  module Builders
    class Invoices
      def initialize(customers, task)
        @customers = customers
        @task = task
      end

      def build_body
        {
          "DocNumber": @task.id,
          "TxnDate": invoice_date,
          "DueDate": due_date
        }
          .merge(lines)
          .merge(customer_info)
      end

      private

      def lines
        {
          "Line": [
            {
              "DetailType": 'SalesItemLineDetail',
              "Amount": @task.total_sum.to_f,
              "SalesItemLineDetail": {
                "ItemRef": {
                  "name": 'Services',
                  "value": '1'
                },
                "Qty": '1',
                "TaxCodeRef": {
                  "value": '2'
                }
              },
              "Description": @task.description
            }
          ]
        }
      end

      def customer_info
        project_customer = find_project_customer
        parent_customer = find_parent_customer(project_customer)

        {
          "CustomerRef": {
            "value": project_customer.dig('Id')
          },
          "BillEmail": {
            "Address": parent_customer.dig('PrimaryEmailAddr', 'Address')
          },
          "BillAddr": parent_customer.dig('BillAddr')
        }
      end

      def find_parent_customer(project_customer)
        @customers.find { |customer| customer['Id'] == project_customer.dig('ParentRef', 'value') }
      end

      def find_project_customer
        @customers.find { |customer| customer['DisplayName'].include?(@task.project_task.number.to_s) }
      end

      def invoice_date
        format_date(@task.completed_at)
      end

      def due_date
        due_date = @task.completed_at.at_beginning_of_month.next_month + 14.days
        format_date(due_date)
      end

      def format_date(date)
        date.strftime('%Y-%m-%d')
      end
    end
  end
end
