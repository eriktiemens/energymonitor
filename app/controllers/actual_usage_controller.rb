class ActualUsageController < ApplicationController
  
   def actual_data
     
     result =YoulessData.order("created_at DESC").first
     
     respond_to do |format|
       format.json {render :json => {"value" => result.pwr, "date"=> result.created_at.strftime("%d/%m/%Y %H:%m:%s")}}
     end
     
   end
  
end
