class StaticController < ApplicationController

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
  end

end
