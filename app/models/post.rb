require 'rest-client'

class Post < ApplicationRecord
  belongs_to :user  
  # firebase_url    = 'entheogen-a76f2.firebaseapp.com'

  def calculate_running_averages(array)
    arr = array.map.with_index do |val, id|
      if id > 0 
          pre_avg = array[id-1]
          pre_sum = pre_avg * id
          len = id+1
          (val+pre_sum)/len
      else 
          val
      end 
    end
  end

  #function to scale events between two numbers
  #reference - https://cycling74.com/forums/what's-the-math-behind-the-scale-object

  def scale(x, xmin, xmax, ymin, ymax)
    xrange = xmax - xmin
    yrange = ymax - ymin
    ymin + (x - xmin) * (yrange.to_f / xrange)     
  end

  #get trough and peak for each average value
  # p stats
  def get_relative_min_max(array)
      min = 1.00000000000000000
      max = 0.00000000000000000
      arr = []
      test = array.map.with_index do |val, id|
          # relative_minimum = min
          # relative_maximum = max

          if  val < min 
              min = val    
          elsif val > max
              max = val
          elsif val == min && val == max 
            min = val - 0.00000000000000001
            max = val
          end
    
          r = scale(val, min, max, -160, -20)
          d = scale(val, min, max, 300, 500)
          n = scale(val, min, max, 20, 100)

          
          {
              average: val,
              rel_min: min,
              rel_max: max,
              scaled_dist: d,
              scaled_rad: r,
              scaled_noise: n 
              # scaled_dist: scale(val, min, max, 20, 600),
              # scaled_rad: scale(val, min, max, -160, 100) 
          }    
      end
  end

  def eeg
    # byebug
     response = RestClient.get self.data_file_url
     orig_data = response.body
    # byebug
     new_data = orig_data.gsub!("NaN", "0.0")
     data = JSON.parse(new_data)
    gamma_relative_data = data["timeseries"]["gamma_relative"]["samples"]
    alpha_relative_data = data["timeseries"]["alpha_relative"]["samples"]
    beta_relative_data = data["timeseries"]["beta_relative"]["samples"]
    delta_relative_data = data["timeseries"]["delta_relative"]["samples"]
    theta_relative_data = data["timeseries"]["theta_relative"]["samples"]

    gamma_relative_averages = gamma_relative_data.map{|arr| arr.sum/arr.length }
    alpha_relative_averages = alpha_relative_data.map{|arr| arr.sum/arr.length } 
    beta_relative_averages = beta_relative_data.map{|arr| arr.sum/arr.length }
    delta_relative_averages = delta_relative_data.map{|arr| arr.sum/arr.length }
    theta_relative_averages = theta_relative_data.map{|arr| arr.sum/arr.length }

    gamma_running_averages = calculate_running_averages(gamma_relative_averages)
    alpha_running_averages = calculate_running_averages(alpha_relative_averages)
    beta_running_averages = calculate_running_averages(beta_relative_averages)
    delta_running_averages = calculate_running_averages(delta_relative_averages)
    theta_running_averages = calculate_running_averages(theta_relative_averages)

    gamma = get_relative_min_max(gamma_running_averages)
    alpha = get_relative_min_max(alpha_running_averages)
    beta = get_relative_min_max(beta_running_averages)
    delta = get_relative_min_max(delta_running_averages)
    theta = get_relative_min_max(theta_running_averages)

    json_data = {
            alpha: alpha,
            beta: beta,
            delta: delta,
            theta: theta,
            gamma: gamma
    }
  end



end
