class Student::ProfilesController < ApiController
  def new
    profile = current_resource_owner.build_profile
    render json: profile.as_json
  end

  def create
    profile = current_resource_owner.build_profile(profile_params)
    if profile.valid?
      profile.save!
      render json: { msg: 'Successfully created' }
    else
      render json: user.errors.full_messages.to_json, status: 400
    end
  end

  def show
    profile = current_resource_owner.profile
    render json: profile.as_json
  end

  def update
    profile = current_resource_owner.build_profile(profile_params)
    if profile.valid?
      profile.save!
      render json: { msg: 'Successfully created' }
    else
      render json: user.errors.full_messages.to_json, status: 400
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :portrait,
      :first_name,
      :last_name,
      :family_name,
      :registration_number,
      :gender,
      :birthday,
      :mobile_number,
      :tel_number,
      :home_address,
      :work_address
    )
  end
end
