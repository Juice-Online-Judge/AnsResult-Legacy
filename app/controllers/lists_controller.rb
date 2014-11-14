class ListsController < ApplicationController
  def index
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
    @lists = @lists.to_a
    @lists = Kaminari.paginate_array(@lists).page(params[:page]).per(20)
  end
end
