module ApplicationHelper
  class AllowedVehicleType
    Small = 1
    Medium = 2
    Large = 3
    
    def self.AllowedVehicleTypes
        return [["Small", 1], ["Medium", 2], ["Large", 3]]
    end
  end
  
  class PreferredDurationType
    Short_Term = 1
    Long_Term = 2
    Both = 3
    
    def self.PreferredDurationTypes
        return [["Short Term", 1], ["Long Term", 2], ["Both", 3]]
    end
  end
  class BookingType
    Discrete = 1
    Continuous = 2    
    
    def self.BookingTypes
        return [["Discrete", 1], ["Continuous", 2]]
    end
  end
end
