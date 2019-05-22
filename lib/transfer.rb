require "pry"

class Transfer

  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  @@all=[]

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @@all.include?(self) #so that if the transfer instance has already been executed, the "new" transfer won't affect the balances
      @sender.balance -= 0
      @receiver.balance += 0
    else
      @sender.balance -= amount
      @receiver.balance += amount
      if self.valid? == false
        @status="rejected"
        "Transaction rejected. Please check your account balance."
      else
        @status="complete"
        @@all << self #to make sure that we can't repeat the same transfer instance
      end
    end
  end

  def reverse_transfer
    if @status=="complete"
      @sender.balance+=amount
      @receiver.balance-=amount
      @status="reversed"
    else
      @sender.balance -= 0
      @receiver.balance += 0
    end
  end



end
