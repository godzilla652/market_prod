unless @entities[:payments].count.eql?(0)
    child @entities[:payments], :object_root => false, :root => "items" do
      extends "api/task_payments/show"
    end
else
    node('items'){[]}
end
node(:account_balance){ @entities[:account_balance] }
node(:amount){ @entities[:amount] }