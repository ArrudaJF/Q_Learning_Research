using Random, Plots
mutable struct Animal
    num_conflicts::Int64
    pay_off::Int64
    final_conflict::Bool
    next_move::String
end

function mouse_policy(input::String, mouse::Animal)

    mouse.num_conflicts += 1

    if input == "R"
        mouse.final_conflict = true
        mouse.pay_off += 60
        mouse.next_move = ""
        return nothing
    end

    if input == "D"
        if rand(1)[0] < 0.10
            mouse.pay_off -= 100
        else
            mouse.pay_off -= 2
        end
        mouse.next_move = "R"
        return "R"

    elseif mouse.num_conflicts >= 500
        mouse.next_move = "R"
        return "R"
    else
        mouse.next_move = "C"
        return "C"
    end

end 

function hawk_policy(input::String, hawk::Animal)

    hawk.num_conflicts += 1
    if input == "R"
        hawk.final_conflict = true
        hawk.pay_off += 60
        hawk.next_move = ""
        return nothing
    end

    if input == "D"
        if rand(1)[0] < 0.1
            hawk.pay_off -= 100
            hawk.next_move = "R"
            return "R"
        else
            hawk.pay_off -= 2
        end
    end

    hawk.next_move = "R"
    return "D"
end

function bully_policy(input::String, bully::Animal)

    bully.num_conflicts += 1
    if input == "R"
        bully.final_conflict = true
        bully.pay_off += 60
        bully.next_move = ""
        return nothing
    end

    if input == "" || input == "C"
        bully.next_move = "D"
        return "D"
    elseif input == "D"
        retaliator = dmg()
        return "C"
end

function retal_policy(input::String, retaliator::Animal)

    retaliator.num_conflicts += 1
    if retaliator.final_conflict == true
        return nothing
    end

    if input == "R" 
        retaliator.final_conflict = true
        retaliator.pay_off += 60
        return nothing
    end

end

function prober_policy(input::String, prober::Animal)

    prober.num_conflicts += 1
    if input == "R"
        prober.final_conflict = true
        prober.pay_off += 60
        return nothing
    end
end