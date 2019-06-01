class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(money)
    @balance += money
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    valid = false
    if @balance > 0 && status == "open"
      valid = true
    else
      valid = false
    end
    valid
  end
  
  def close_account
    if @status == "open"
      @status = "closed"
    end
  end
end
