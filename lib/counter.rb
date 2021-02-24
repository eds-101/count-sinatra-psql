require_relative './database_connection'

class Counter
  def count
    result = DatabaseConnection.query("SELECT * FROM counter WHERE id=1;")
    result[0]['count'].to_i
  end

  def increment
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = '#{read_count + 1}' WHERE id=1;")
    update_timestamp
  end

  def decrement
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = '#{read_count - 1}' WHERE id=1;")
    update_timestamp
  end

  def update_timestamp
    time_stamp = Time.now.strftime("%k:%M:%S on %d/%m/%Y").strip
    last_updated = DatabaseConnection.query("UPDATE counter SET last_updated = '#{time_stamp}' WHERE id=1;")
  end

  def self.instance
    @counter ||= Counter.new
  end
end
