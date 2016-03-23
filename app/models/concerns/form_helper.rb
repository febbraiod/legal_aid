module FormHelper

  def form_attributes
    attributes = []
    self.attributes.each do |a|
      attributes << a[0].to_sym
    end
    attributes.pop(2)
    attributes.shift
    attributes
  end

end