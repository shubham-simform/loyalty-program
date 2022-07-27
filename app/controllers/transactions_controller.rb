class TransactionsController < ApplicationController
  
  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = Transaction.new
  end

  def edit; end

  def create
    @transaction = current_user.transactions.new(transaction_params)
   
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction succesfully created.' }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_date, :amount, :country)
  end

end
