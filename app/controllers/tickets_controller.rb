class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show]

  # GET /tickets
  def index
    where_params = { project_id: params[:project_id], status: params[:status] }
    where_params = where_params.filter { |_, val| val.present? }

    @tickets = where_params.size.zero? ? Ticket.all : Ticket.where(where_params)

    if params[:tag_id].present?
      @tickets = @tickets.filter do |ticket|
        ticket.tag_ids.include? params[:tag_id].to_i
      end
    end
  end

  # GET /tickets/1
  def show
    @comment = Comment.new
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
    @ticket.creator = current_user

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
      .permit(:name, :body, :status, :project_id, :assignee_id, tag_ids: [])
      .merge({ open: params[:ticket][:status] != 'fixed' })
  end
end
