module ApplicationHelper
  def guess_text(preference)
    if preference == '-1'   #Tastes::PREFERENCE_DOG
      'dogs'
    elsif preference == '1' #Tastes::PREFERENCE_CAT
      'cats'
    else
      preference
    end
  end
end
