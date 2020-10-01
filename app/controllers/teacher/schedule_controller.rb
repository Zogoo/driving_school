class Teacher::ScheduleController < Teacher::BaseController
  # GET	/student/schedule
  def index
    all_schedule = current_teacher.schedules.all.as_json
    render json: all_schedule.as_json
  end

  # POST /student/schedule
  def create
    new_schedule = current_teacher.schedules.new(schedule_params)
    if new_schedule.valid?
      new_schedule.save!
      render json: { msg: 'Successfully created' }
    else
      render json: new_schedule.errors.full_messages.to_json, status: 400
    end
  end

  # GET /student/schedule/new
  def new
  end

  # GET /student/schedule/:id/edit
  def edit
  end

  # GET /student/schedule/:id
  def show
  end

  # PUT or PATCH /student/schedule/:id
  def update
  end

  # DELETE /student/schedule/:id
  def destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :start,
      :finish,
      :step,
      :driving_lesson_id,
      :theory_lesson_id
    )
  end
end
