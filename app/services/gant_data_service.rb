class GantDataService
  def self.call(*args)
    new(*args).call
  end

  def initialize(project_task)
    @project_task = project_task
  end

  def call
    project_task.tasks.map do |task|
      next unless valid_task?(task)
      {
          name: task.title,
          desc: task.description,
          dataObj: {
              budget: task.budget_round,
              owner: task.owner&.full_name,
              contractor: task.concierge&.full_name
          },
          values: [
              {
                  from: task.date_start&.to_date.to_s,
                  to: task.date_limit&.to_date.to_s,
                  label: 'Planned time UTC',
                  customClass: 'ganttPlanned'
              },
              {
                  from: task.fact_start&.to_date.to_s,
                  to: task.fact_end&.to_date.to_s,
                  label: 'Fact time UTC',
                  customClass: 'ganttFact',
                  isLower: true
              }
          ]
      }
    end.compact.to_json
  end

  private

  attr_reader :project_task

  def valid_task?(task)
    (task.date_start.present? && task.date_limit.present?) || (task.fact_start.present? && task.fact_end.present?)
  end
end

