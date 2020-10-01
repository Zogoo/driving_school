module CommonErrorHelper
  extend ActiveSupport::Concern
  included do
    def missing_params(expection)
      render json: { error_message: expection.message }, status: 400
    end

    def invalid_record(expection)
      render json: { error_message: expection.record.errors.messages.values.join(' ') }, status: 400
    end
  end
end
