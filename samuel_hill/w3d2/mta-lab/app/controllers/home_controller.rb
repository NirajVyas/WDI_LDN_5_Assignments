class HomeController < ApplicationController
  protect_from_forgery

	def index

		@mta = mta

		if params[:start_train]
      start_train = params[:start_train].to_sym
      stop_a = params[:stop_a]
      stop_train = params[:stop_train].to_sym
      stop_b = params[:stop_b]

      if start_train != stop_train
        intersection = (mta[start_train] & mta[stop_train]).first

        stop_a_index = mta[start_train].index(stop_a)
        stop_a_intersection_index = mta[start_train].index(intersection)
        trip_a_length = (stop_a_index - stop_a_intersection_index).abs

        stop_b_index = mta[stop_train].index(stop_b)
        stop_b_intersection_index = mta[stop_train].index(intersection)
        trip_b_length = (stop_b_index - stop_b_intersection_index).abs

        total_length_of_trip = trip_a_length + trip_b_length
      else
        stop_a_index = mta[start_train].index(stop_a)
        stop_b_index = mta[stop_train].index(stop_b)
        total_length_of_trip = (stop_a_index - stop_b_index).abs
      end

      @total_length_of_trip = total_length_of_trip
    end

		@total_length_of_trip = total_length_of_trip

		render 'index'

	end

	def mta

		n = ['ts', '34th', '28th-n', '23rd-n', 'us', '8th']
		l = ['8th', '6th', 'us', '3rd', '1st']
		s = ['gc', '33rd', '28th-s', '23rd-s', 'us', 'ap']

		mta = {}

		mta[:n] = n
		mta[:l] = l
		mta[:s] = s

    return mta

	end

end