require 'date'
class User_Terminal
    attr_reader :max_balance
    MAX_BALANCE = 900
  def initialize
    @max_balance = MAX_BALANCE
  end

  def add_balance(oystercard, amount = 1) # 1 pence
    @oystercard = oystercard
    @amount = amount
    raise "Maximum balance exceeded" if self.max_balance_exeded?
    @oystercard.balance += @amount
  end

  def max_balance_exeded?
    (@oystercard.balance + @amount > @max_balance) ? true : false
  end

  def history(oystercard)
    oystercard.journeys.each do |journey|
      start_date = Time.at(journey.content_view[:from_time]).to_date.to_s
      start_station = journey.content_view[:from_station].object_id
      puts "#{start_date} #{start_station} Station \n to"
      (journey.content_view[:fare] != :none) ? puts_end_journey(journey) : nil
    end
      true
  end

  def get_end_journey(journey)
    @end_date = Time.at(journey.content_view[:to_time]).to_date.to_s
    @end_station = journey.content_view[:to_station].object_id
    @fare = journey.content_view[:fare]
    puts "#{@end_date} #{@end_station} Station - £#{@fare.to_f/100}"
  end
end