class ActualUsageController < ApplicationController
  
   def actual_data
     
     result = YoulessData.maximum(:created_at)
     
     respond_to do |format|
       format.json {render :json => {"value" => result.pwr, "date"=>result.created_at}}
     end
     
   end
  
end
