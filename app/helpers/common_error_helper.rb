module CommonErrorHelper
  extend ActiveSupport::Concern
  included do

    def missing_params(expection)
      render json: { error_message: expection.message }, status: 400
    end
  end
end
