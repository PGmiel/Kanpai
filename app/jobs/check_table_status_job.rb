class CheckTableStatusJob < ApplicationJob
  queue_as :default

  def perform(table_id)
    @table = Table.find(table_id)
    if @table.status == "available"
      @table.update(status: "booked")
      @table.bookings.where(status: "booked").update(status: "done")
    end
  end
end
