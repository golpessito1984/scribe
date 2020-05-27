module ApplicationHelper
  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.errors.count < 1
  end
end
