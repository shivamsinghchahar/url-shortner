class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::NotNullViolation, with: :not_null_violation

  private
    def not_null_violation
      render status: :unprocessable_entity, json: { errors: ['Invalid input'] }
    end
end
