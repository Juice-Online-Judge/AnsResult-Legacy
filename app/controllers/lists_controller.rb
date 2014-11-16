class ListsController < ApplicationController
  def index
    redirect_to errors_path, alert: "Please contact to admin for access permission" if current_user.role == "unauth"
    @exercises = Hash.new {|h, k| h[k] = []}
    @exe2 = []
    LessonExercise.find_each { |exercise|
      @exercises[exercise.lesson_unit] << exercise.id
      @exe2 << exercise
    }
    @exe = @exercises
    @test = []
    @titles = @exercises.map { |k, v|
      title = v.map.with_index { |x, i|
        [x, "#{k}-#{i}"]
      }
      @test << title
      title
    }
    @titles.flatten!(1)
    @titles = Hash[@titles]
    @lists = Hash.new { |hash, key|
      data = @titles.map { |k, v|
        [v, nil]
      }
      hash[key] = Hash[data]
    }
    UserSubmission.find_each { |submission|
      sid = UserData.find(submission.submit_user).std_id
      @lists[sid][@titles[submission.link_id]] = if submission.judge_result == 1 then "AC" else "WA" end
    }
    respond_to do |format|
      format.json {
        title = @titles.to_a.map {|x| x.fetch(1)}
        columns = ["Id"] + title
        data = {result: {columns: columns}}
        data[:result][:values] = @lists.map do |k, v|
          {"Id" => k}.merge v.zip(title).inject(Hash.new) { |h, x|
            h[x[1]] = if x[0][1] then x[0][1] else "" end
            h
          }
        end
        data[:total] = data[:result][:values].size
        render json: JSON.pretty_generate(data)
      }
      format.html {
        @lists = @lists.to_a
        @lists = Kaminari.paginate_array(@lists).page(params[:page]).per(20)
      }
    end
  end
end
