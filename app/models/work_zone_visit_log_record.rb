class WorkZoneVisitLogRecord

  attr_reader :user, :work_zone, :date, :logs

  def initialize(params = {})
    params.each {|k, v| instance_variable_set "@#{k}", v }
  end

  def spended_seconds
    logs.map(&:spended_seconds).inject &:+
  end

end
