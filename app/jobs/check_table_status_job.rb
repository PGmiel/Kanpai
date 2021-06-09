class CheckTableStatusJob < ApplicationJob
  queue_as :default

  def perform(table_id)
    @table = Table.find(table_id)
    @table.update(status: "booked")
  end
end
