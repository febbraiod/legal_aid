module FormHelper

  def form_attributes
    attributes = []
    self.attributes.each do |a|
      attributes << a[0].to_sym
    end
    delete = [:created_at, :updated_at, :id]
    a = attributes.each.reject {|i| delete.each.include?(i)}
    a.sort
  end

end