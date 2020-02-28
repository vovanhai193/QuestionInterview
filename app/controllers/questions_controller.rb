class QuestionsController < ApplicationController
  def question1
    @arr = array_params(params[:arr]) || [9,1,8,2,7,3,6,4,5,10,13]
    @asc_arr = BubbleSortService.new(@arr.dup, :ASC).perform
    @desc_arr = BubbleSortService.new(@arr.dup, :DESC).perform
  end

  def question2
    @arr1 = array_params(params[:arr1]) || [3, 4, 6, 3, 7, 8, 5, 9]
    @arr2 = array_params(params[:arr2]) || [5, 4, 1, 2, 3]

    @common_arr = CommonElementService.new(@arr1, @arr2).perform
  end

  def question3
    @str = params[:str] || "abcdabcdabcdabcdeabcdcba" 

    @first_non_repeated_char = FirstNonRepeatedCharService.new(@str).perform
  end

  def question4
    @str = params[:str] || "zyabcdabcac" 

    @asc_hash = SortNumberOfCharService.new(@str, :ASC).perform
    @desc_hash = SortNumberOfCharService.new(@str, :DESC).perform
  end

  def question5
    logger = MultiLogger.new(STDOUT, 'log/logfile.log')
    logger.info("This is info log")
    logger.warn("This is warn log")
    logger.error("This is debug log")
  end

  private

  def array_params arr
    return unless arr && arr.is_a?(Array)

    arr.map(&:to_i)
  end
end
