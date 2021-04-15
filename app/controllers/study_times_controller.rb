# frozen_string_literal: true

# Controller for the studytime creation and selection
class StudyTimesController < ApplicationController
  # before_action :set_study_time, only: %i[show edit update destroy]

  # GET /study_times or /study_times.json
  def index
    @study_times = StudyTime.all
  end

  # GET /study_times/1 or /study_times/1.json
  def show; end

  # GET /study_times/new
  def new
    @study_time = StudyTime.new
  end

  # GET /study_times/1/edit
  def edit; end

  # POST /study_times or /study_times.json
  def create
    @study_time = StudyTime.new(study_time_params)
    @study_time.save

  end

  # PATCH/PUT /study_times/1 or /study_times/1.json
  def update

  end

  # DELETE /study_times/1 or /study_times/1.json
  def destroy
    @study_time.destroy

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study_time
    @study_time = StudyTime.find(params[:id])
  end

  def create_all_study_times
    deadline_list = []
    Deadline.find_each do |deadline|
      deadline_list.push(deadline)
    end

    deadline_list.sort_by { |deadline| -deadline.study_preferences[:priority] }
    all_times_needed = []
    ## futher implementation is required
    # timePreferences = getTimePreferences

    (0..deadline_list.length-1).each do |i|
      # times = timePreferences
      times = []
      (0..all_times_needed.length-1).each do |j|
        times.push(all_times_needed[j])
      end
      times = times.sort
      deadline = deadline_list[i]
      timeneeded = deadline.study_preference[:requiredTime] / 30
      selected_times = select_best_times(find_times_available(times, 14, 20, deadline[:time]), timeneeded,
                                         'balance_load')

      (0..selected_times.length-1).each do |k|
        all_times_needed.push([selected_times[k], 1])
        create(deadline, selected_times[k], selected_times[k] + 30.minutes)
      end
    end
  end

  def find_times_available(schedule, wakeup_time, sleep_time, deadline, time = Time.zone.now)
    counter = 0
    skip = 0
    times_available = []
    if time.year == deadline.year
      (time.yday..deadline.yday).each do |i|
        (time_to_halves(wakeup_time)..(time_to_halves(sleep_time) - 1)).each do |j|
          if skip.positive?
            skip -= 1
            next
          end
          # rubocop:todo Style/GuardClause
          if time.yday == i && datetime_to_halves(time) > j
            next
          # rubocop:enable Style/GuardClause

          elsif deadline.yday == i && datetime_to_halves(deadline) - 1 < j
            next

          elsif i == schedule[counter][0].yday && j == datetime_to_halves(schedule[counter][0])
            skip = skip + schedule[counter][1] - 1
            counter -= 1
          else
            times_available.append(DateTime.ordinal(time.year, i, j / 2, (j % 2) * 30))
          end
        end
      end
    end
    times_available
  end

  def select_best_times(times_available, blocks_needed, method)
    return [] if times_available.empty?

    times_selected = []

    # prioritize early time blocks
    case method
    when 'complete_early'
      (0..blocks_needed - 1).each do |i|
        return [] if times_available.length < i

        times_selected.push(times_available.shift)
      end
    # prioritize even distribution
    when 'spread_evenly'
      temp_day = times_available[0]
      times_selected.push(times_available.shift)
      blocks_needed -= 1
      while blocks_needed.positive?

        return [] if times_available.empty?

        if temp_day == times_available[0]
          times_selected.push(times_available.shift)
          temp_day = times_available[0]
          blocks_needed -= 1
          next
        end

        if temp_day.yday == times_available[0].yday
          times_available.push(times_available.shift)
          next
        end
        temp_day = times_available[0]
        times_selected.push(times_available.shift)
        blocks_needed -= 1

      end

      times_selected = times_selected.sort

    # prioritize days with more free time
    when 'balance_load'
      days = []
      counter = 0
      temp_day = times_available[0].yday
      days.push([times_available.shift])
      while times_available.length.positive?
        if times_available[0].yday == temp_day
          days[counter].push([times_available.shift])

        else
          days.push([])
          counter += 1
          temp_day = times_available[0].yday
        end
      end

      while blocks_needed.positive?

        return [] if days.empty?

        max = 0
        pos = 0
        (0..days.length - 1).each do |i|
          if days[i].length > max
            max = days[i].length
            pos = i
          end
        end
        times_selected.push(days[i].shift)
        blocks_needed -= 1
        days.delete_at(i) if days[i].empty?
        times_selected = times_selected.sort
      end
    end

    times_selected
  end

  def time_to_halves(time_a)
    (time_a / 0.5).to_i
  end

  def datetime_to_halves(time_a)
    (time_a.hour * 2 + (time_a.min / 30)).to_i
  end

  def study_time_params
    params.require(:study_time).permit(:deadline_id, :start, :end)
  end
end
