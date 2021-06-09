class CheckTableStatusJob < ApplicationJob
  queue_as :default

  def perform(table_id)
    @table = Table.find(table_id)
    @table.status = "Booked"
  end
end
