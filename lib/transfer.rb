class Transfer
  # your code here
    attr_reader :name, :balance, :status,:sender, :receiver, :amount

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = 'pending'
      @amount = amount

    end

    def valid?
      flg= sender.valid? && receiver.valid?
      flg
    end

    def execute_transaction
       # binding.pry
      if (self.valid? && @sender.balance >= @amount && @status == 'pending')
        @receiver.balance = @sender.balance + @amount
        @sender.balance = @sender.balance - @amount
        @status = 'complete'
        # binding.pry
      elsif (@amount > @sender.balance)
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
          end

    end
    def reverse_transfer

      if (@status == 'complete')
        @sender.balance += @amount
        @receiver.balance -= @amount
        # binding.pry
        @status = 'reversed'
      else
        "Transaction cannot be reversed."
      end

    end

end
