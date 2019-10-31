class Result < ApplicationRecord
  class << self
    def convert(params)
      new_params = {}
      analysis = params.require(:analysis).permit(:muscleCount, :remainingClearSecond, :getKeySecond)
      [:name, :score, :difficulty, :life].each{|hash| new_params[hash] = params[hash]}
      new_params[:muscle] = points_of_muscle(analysis[:muscleMenu].to_i, new_params[:difficulty])
      new_params[:speed] = points_of_speed(analysis[:remainingClearSecond].to_i, new_params[:difficulty])
      new_params[:affinity] = points_of_affinity(analysis[:getKeySecond].to_i, new_params[:difficulty])
      new_params[:exploratory] = points_of_exploratory
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

    def points_of_speed(remaining_second, difficulty)
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

    def points_of_affinity(get_key_seconnd, difficulty)
      0
    end

    def points_of_exploratory
      0
    end
  end
end
