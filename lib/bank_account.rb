require 'pry'

class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'

  end

  def deposit (amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    flg=(@status == "open" && @balance > 0)
    # binding.pry
  #  puts ("balance = #{@balance}")
    flg
  end

  def close_account
    @status= "closed"
  end

end
