class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = 'Ticket was successfully created.'
      redirect_to @ticket
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      flash[:success] = 'Ticket was successfully updated.'
      redirect_to @ticket
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    flash[:success] = 'Ticket was successfully destroyed.'
    redirect_to tickets_url
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket)
      .permit(:name, :body, :status, :project_id, tag_ids: [])
      .merge({ open: params[:ticket][:status] != 'fixed' })
  end
end
