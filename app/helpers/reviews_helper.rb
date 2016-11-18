module ReviewsHelper
  def left_feedback?(appt)
    appt.reviews.each do |r|
      return true if r.user = current_user
    end
    return false
  end

  def mentor_feedback(appt)
    appt.reviews.each do |r|
      return r if r.user = appt.mentor
      return nil
    end
  end

  def student_feedback(appt)
    appt.reviews.each do |r|
      return r if r.user = appt.student
      return nil
    end
  end
end
