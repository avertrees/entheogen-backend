# require 'csv'
require 'pry'
# require 'open-uri'
require 'json'

# url = 'Muse-AF00_2018-11-15--06-27-16_1542282303988.csv'
#data = CSV.new(open(url), :headers => :first_row)
#puts data.readline
# CSV.foreach(data.path) do |row|
     
# end

url =  "db.json"
# Muse-AF00_2018-10-06--15-13-38_1538854660399.json
#Muse-AF00_2018-11-15--06-27-16_1542282303988.json
orig_data = File.read('Muse-AF00_2018-11-15--06-27-16_1542282303988.json')

new_data = orig_data.gsub!("NaN", "0.0")
data = JSON.parse(new_data)
# .split(' ')
# data = orig_data.map{ |w| w == ("NaN") ? "0.0" : w } 
#orig_data.split(' ')
# p data
p data.class

#this works, awesomea
gamma_relative_data = data["timeseries"]["gamma_relative"]["samples"]
alpha_relative_data = data["timeseries"]["alpha_relative"]["samples"]
beta_relative_data = data["timeseries"]["beta_relative"]["samples"]
delta_relative_data = data["timeseries"]["delta_relative"]["samples"]
theta_relative_data = data["timeseries"]["theta_relative"]["samples"]

p %{ gamma length #{gamma_relative_data.length}  }
p %{ alpha length #{alpha_relative_data.length}  }
p %{ beta length #{beta_relative_data.length}  }
p %{ delta length #{delta_relative_data.length}  }
p %{ theta length #{theta_relative_data.length}  }


#get averages for data
gamma_relative_averages = gamma_relative_data.map{|arr| arr.sum/arr.length }
alpha_relative_averages = alpha_relative_data.map{|arr| arr.sum/arr.length } 
beta_relative_averages = beta_relative_data.map{|arr| arr.sum/arr.length }
delta_relative_averages = delta_relative_data.map{|arr| arr.sum/arr.length }
theta_relative_averages = theta_relative_data.map{|arr| arr.sum/arr.length }

def calculate_running_averages(array)
    arr = array.map.with_index do |val, id|
        if id > 0 
            # x = val 
            # y = array[id-1]
            (val+array[id-1])/2
        else 
            val
        end 
    end
end

# json_data = Hash.new(0)
p %{ gamma length #{gamma_relative_averages.length}  }
p %{ alpha length #{alpha_relative_averages.length}  }
p %{ beta length #{beta_relative_averages.length}  }
p %{ delta length #{delta_relative_averages.length}  }
p %{ theta length #{theta_relative_averages.length}  }

# p %{ gamma avgs #{gamma_relative_averages}  }
p %{ gamma low #{gamma_relative_averages.min}  }
p %{ gamma high #{gamma_relative_averages.max}  }

# p %{ alpha avgs #{alpha_relative_averages}  }
p %{ alpha low #{alpha_relative_averages.min}  }
p %{ alpha high #{alpha_relative_averages.max}  }

# p %{ beta avgs #{beta_relative_averages}  }
p %{ beta low #{beta_relative_averages.min}  }
p %{ beta high #{beta_relative_averages.max}  }

# p %{ delta avgs #{delta_relative_averages}  }
p %{ delta low #{delta_relative_averages.min}  }
p %{ delta high #{delta_relative_averages.max}  }

# p %{ theta avgs #{theta_relative_averages}  }
p %{ theta low #{theta_relative_averages.min}  }
p %{ theta high #{theta_relative_averages.max}  }


#function to scale events between two numbers
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
        # if id != 0

        
        if  val < min 
            min = val    
        elsif val > max
            max = val
        elsif val == min && val == max 
           min = val - 0.00000000000000001
           max = val
        end
    
        # end
        # p min
        # p max
        d = scale(val, min, max, 20, 600)
        r = scale(val, min, max, -160, 100)
        {
            average: val,
            rel_min: min,
            rel_max: max,
            scaled_dist: d,
            scaled_rad: r 
            # scaled_dist: scale(val, min, max, 20, 600),
            # scaled_rad: scale(val, min, max, -160, 100) 
        }    
    end
end

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
    data:{
        alpha: alpha,
        beta: beta,
        delta: delta,
        theta: theta,
        gamma: gamma
    }
}.to_json

#p json_data

out_file = File.new("db.json", "w")
out_file.puts(json_data)
out_file.close