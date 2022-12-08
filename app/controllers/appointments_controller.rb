class AppointmentsController < ApplicationController
    skip_before_action :authorized, only: [:destroy]

    def index 
        appointments = Appointment.all 
        render json: appointments
    end

    def show 
        appointment = Appointment.find(params[:id])
        render json: appointment
    end

    def create
        appointment = Appointment.create(
            user_id: params[:user_id],
            name: params[:name], 
            email: params[:email],
            appointment_date: params[:appointment_date],
            appointment_time: params[:appointment_time])

            render json: appointment, status: :created
        
    
      end

      def update
        appointment = Appointment.find_by(id: params[:id])
        if appointment
            Appointment.update(appointment_params)

            render json: appointment
        else
        render json: { error: "Appointment not found" }, status: :not_found
      end
    end


      def destroy
        appointment = Appointment.find(params[:id])
        if appointment
            appointment.destroy
            # head :no_content
            render json: {"success": "Appointment not found"}
        
        else
            render json: {error: "Appointment not found"}, status: :not_found
        end
      end

      private
      def appointment_params
        params.permit(:name, :email, :appointment_date, :appointment_time)
      end

    

end
