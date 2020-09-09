class Cat < ApplicationRecord
    validates :sex, length: {is: 1}
    validates :color, inclusion: ["calico", "white", "black"]

    # validate some more stuff & add corresponding DB constraints
    
    # def age
    #     #We will add this function later.
    #     return 2
    # end
    
end

# functionaltiy, second level of protection re: database constrainst
# gives better messages when it's validated
# additionally, omre complicated forms of validation 