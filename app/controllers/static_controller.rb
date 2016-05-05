class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:stats]

  def home
  end

  def about
  end

  def stats
    most_val_arr = Client.most_valueable_client
    @most_val = Client.find_by(id: most_val_arr[0])
    @sum_exposure = most_val_arr[1]
    pop_county_arr = Case.popular_county
    @pop_county = pop_county_arr[0]
    @cases_in_pop_county = pop_county_arr[1]
    @active_case = Case.case_with_most_notes
    # refactor most of this to model methods!
  end

end
