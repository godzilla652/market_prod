module Locations
  module WorkZones
    class VisitLogger < BaseService

      MAX_ABSENCE_TIME = 5.minutes

      attr_reader :work_zone, :user

      def call
        existing_log.present? ? update_existing_log : create_log
      end

      private

      def existing_log
        WorkZoneVisitLog.where(user_id: user.id, work_zone_id: work_zone.id, date: date)
                        .where('time_to > ?', max_time_from)
      end

      def max_time_from
        Time.now - MAX_ABSENCE_TIME
      end

      def update_existing_log
        existing_log.update time_to: Time.now
      end

      def create_log
        WorkZoneVisitLog.create user: user, work_zone: work_zone, time_from: Time.now, time_to: Time.now, date: date
      end

      def date
        Time.now.utc.to_date
      end

    end
  end
end
