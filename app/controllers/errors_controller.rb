# app/controllers/errors_controller.rb
class ErrorsController < ApplicationController
    def not_found
      respond_to do |format|
        format.html { render "errors/not_found", status: :not_found }
        format.any { head :not_found } # Respond with a 404 for unsupported formats
      end
    end
end
