class ParkingSpaceLot < ActiveRecord::Base
  belongs_to :parking_space
  attr_accessible :allowed_vehicle_type_id, :end_date, :end_time, :number_of_lots, :preferred_duration_type_id, :start_date, :start_time
  def AllowedVehicleType
    allowed_vehicle_type_id = AllowedVehicleType.AllowedVehicleTypes().select { |key, value| value == self.allowed_vehicle_type_id }
    
    if allowed_vehicle_type_id.nil? 
      return nil 
    else 
      return allowed_vehicle_type_id[0][0] 
    end
  end
  def PreferredDurationType
    preferred_duration_type_id = PreferredDurationType.PreferredDurationTypes().select { |key, value| value == self.preferred_duration_type_id }
    
    if preferred_duration_type_id.nil? 
      return nil 
    else 
      return preferred_duration_type_id[0][0] 
    end
  end  

end
