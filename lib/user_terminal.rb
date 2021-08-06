require 'date'
class UserTerminal 
  attr_reader :max_balance
  MAX_BALANCE = 900

  def initialize
    @max_balance = MAX_BALANCE
  end

  def add_balance(oystercard, amount) # 1 pence
    @oystercard, @amount = oystercard, amount
    raise "Maximum balance exceeded" if self.max_balance_exeded?
    @oystercard.balance += @amount
  end

  def max_balance_exeded?
    (@oystercard.balance + @amount > @max_balance) ? true : false
  end

  def history(oystercard, journey_log = [])
    oystercard.journeys.each do |journey|
      journey_info = get_start_journey(journey)
      journey_info << puts_end_journey(journey) if journey[:fare] != :none
      journey_log.push(journey_info)
    end 
    journey_log
  end

  def get_start_journey(journey)
    journey = journey.content_view
    start_station, start_date = journey[:from_station], epoch_to_string(journey[:from_time])
    "#{start_date} #{start_station} Station \n to"
  end

  def get_end_journey(journey)
    journey = journey.content_view
    @end_date , @end_station = epoch_to_string(journey[:to_time]), journey[:to_station]
    "#{@end_date} #{@end_station} Station - £#{journey[:fare].to_f/100}"
  end

  def epoch_to_string(time)
    Time.at(time).to_date.to_s
  end

end