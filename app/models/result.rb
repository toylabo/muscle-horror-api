class Result < ApplicationRecord
  class << self
    def convert(params)
      new_params = {}
      analysis = params.require(:analysis).permit(:muscleMenu, :muscleSpeed, :clearTime, :remainingTime)
      [:name, :score, :difficulty, :life].each{|hash| new_params[hash] = params[hash]}
      new_params[:muscle] = points_of_muscle(analysis[:muscleMenu].to_i, new_params[:difficulty])
      new_params[:speed] = points_of_speed(analysis[:MuscleSpeed].to_i, new_params[:difficulty])
      new_params[:affinity] = points_of_affinity(analysis[:clearTime].to_i, new_params[:difficulty])
      new_params[:exploratory] = points_of_exploratory(analysis[:clearTime].to_i, new_params[:key].to_i, new_params[:difficulty])
      new_params
    end

    private
    def points_of_muscle(count, difficulty)
      case difficulty.downcase
      when "easy"
        score = 2 * count - 1
        score = 5 if score > 5
      when "normal"
        count
      when "difficult"
        (count / 2).to_i + 1
      else
        nil
      end
    end

    def points_of_speed(muscle_Speed, difficulty)
      case difficulty.downcase
      when "easy"
        0
      when "normal"
        0
      when "difficult"
        0
      else
        nil
      end
    end

    def points_of_affinity(clear_time, difficulty)
      case difficulty.downcase
      when "easy"
        0
      when "normal"
        0
      when "difficult"
        0
      else
        nil
      end
    end

    def points_of_exploratory(clear_time, key, difficulty)
      case difficulty.downcase
      when "easy"
        0
      when "normal"
        0
      when "difficult"
        0
      else
        nil
      end
    end
  end
end
