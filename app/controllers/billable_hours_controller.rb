# frozen_string_literal: true

class BillableHoursController < ApplicationController
  before_action :set_billable_hour, only: %i[show update destroy]

  # GET /billable_hours
  def index
    @billable_hours = BillableHour.all

    render json: @billable_hours
  end

  def invoice
    if !current_user.finance?
      render json: {message: "You're not permitted to perform this action"}, status: :unauthorized
    else
      companies = Company.all
      result = []
      if companies.present?
        result = BillableHour.invoice(companies)
      end
      render json:  result
    end
  end

  # GET /billable_hours/1
  def show
    render json: @billable_hour
  end

  # POST /billable_hours
  def create
    @billable_hour = BillableHour.new(billable_hour_params)

    if @billable_hour.save
      render json: @billable_hour, status: 201, location: @billable_hour
    else
      render json: @billable_hour.errors, status: 422
    end
  end

  # PATCH/PUT /billable_hours/1
  def update
    if @billable_hour.update(billable_hour_params)
      render json: @billable_hour
    else
      render json: @billable_hour.errors, status: 422
    end
  end

  # DELETE /billable_hours/1
  def destroy
    @billable_hour.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_billable_hour
    @billable_hour = BillableHour.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def billable_hour_params
    params.require(:billable_hour).permit(:employee_id, :billable_rate, :company_id, :date, :start_time, :end_time)
  end
end
