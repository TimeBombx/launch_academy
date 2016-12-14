module ItemHelper
  def human(num)
    number_to_human(num, :format => '%n%u', :units => { :thousand => 'K' })
  end
end
