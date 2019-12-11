module PermissionsConstants

  # MODELS = [WorkZone, User, TaskSuggestion, Category, Complaint, Contract, Country, FavoriteTask, Device, LineTask, Locations::WorkZones::VisitLogger, Message,
  #           Place, Project, Rating, CashOutPayment, TaskPayment, Task, :settings]

  MODELS = ['MobileApp', 'AdminPanel', Project, Task, 'Invoice', 'Quote', 'Tracker', Contract, 'AstraTeam', 'Property', 'Setting']
  ONLY_READ_MODELS = ['MobileApp', 'AdminPanel']

  GENERAL_PERMISSIONS = %w[read_access manage_access]

end
