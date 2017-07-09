class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @character_count_with_spaces = @text.length

    @word_count = @text.split.count
    
    @atext = @text.gsub(/\s+/, "")
    
    
    @character_count_without_spaces = @atext.length
    
    @special_word_count = []
    
    @btext = @text.downcase
    
    @aspecial_word= @special_word.downcase
    
    @btext.split.each do |word|
      if word == @special_word
        @special_word_count.push(word)
        
      end
    end
    
 

    @occurrences = @special_word_count.length

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    
    @number_of_payments = @years * 12
    @number_of_payments.to_f
    @monthly_interest_rate = (@apr/100) / 12
    @one_plus_monthly = @monthly_interest_rate + 1
    @monthly_number_of_payments = @one_plus_monthly**@number_of_payments
    @numerator = @monthly_number_of_payments * @monthly_interest_rate
    @divisor = @monthly_number_of_payments- 1
  
    @monthly_payment = @principal * ( @numerator / @divisor)


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    
    
    @seconds = @ending - @starting
    @minutes = @seconds / 60
    @hours = @minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
    @years = @weeks / 52

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum
    
    @median_temp= [ ]
    @median_calculate= [ ]
    # @median_mean = fixnum
    
    if @count%2 == 1
      @count.to_i
      @median_location = (@count / 2)
      @median_temp.push(@sorted_numbers[@median_location])
    else
      @count.to_i
      @median_location_1= (@count / 2)
      @median_location_2= (@count / 2) - 1
      @median_calculate.push(@sorted_numbers[@median_location_1])
      @median_calculate.push(@sorted_numbers[@median_location_2])
      @median_mean = @median_calculate.sum / 2
      @median_temp.push(@median_mean)
      
      
    end

    @median = @median_temp.to_s

    @sum = @numbers.sum

    @mean = @sum / @count
    
    @sum_squares = [ ]
    
    @numbers.each do |num|
      difference = @mean - num
      square = difference**2
      @sum_squares.push(square)
    end
      

    @variance = @sum_squares.sum / @sum_squares.count

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
