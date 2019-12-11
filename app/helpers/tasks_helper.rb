module TasksHelper

  def photo_absent_class(photo)
    'photo-absent' unless photo.exists?
  end

  def photo_link(photo)
    photo.exists? ? photo.url : ''
  end

  def line_task_budget(line_task)
    line_task.budget_tax ? line_task.total_budget : '0.0'
  end

  def line_task_tax(line_task)
    line_task.budget ? line_task.budget_tax : '0.0'
  end

  def task_tax(task)
    task.total_sum ? task.budget_tax.round(2) : '0.0'
  end

  def task_profent_full(task)
    task.budget_tax ? task.profent_full.round(2) : '0.0'
  end

  def is_accepted?(task)
    task.confirmed? || task.done? || task.done_confirmed?
  end

  def task_status(task)
    if task.confirmed?
      'Accepted'
    else
      task.done_confirmed? ? 'Confirmed' : task.status&.capitalize
    end
  end
end
