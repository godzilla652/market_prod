module BasePolicy

  extend ActiveSupport::Concern

  attr_reader :user, :record

  included do
    def initialize(user, record)
      @user = user
      @record = record.to_s
    end

    def index?
      check_permission 'read_access'
    end

    def show?
      check_permission 'read_access'
    end

    def create?
      check_permission 'manage_access'
    end

    def new?
      create?
    end

    def update?
      check_permission 'manage_access'
    end

    def edit?
      update?
    end

    def destroy?
      check_permission 'manage_access'
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        scope.all
      end
    end

    private

    def klass_name
      record.to_s
    end

    def check_permission(action)
      return false unless user
      has_permission = user.permissions.where(subject_class: klass_name, action: action, active: true).any?
      return false unless has_permission
      true
    end
  end

end
