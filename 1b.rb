def fuel_needed_for_mass(mass)
    [(mass.to_i / 3) - 2, 0].max
end

# Tail recursion ftw!
# Yeah, I know Ruby has no tail recursion optimization and this is essentially not an optimization
def total_fuel_need(mass, total = 0)
    if mass <= 0
        return total
    end
    fuel_for_curr_mass = fuel_needed_for_mass(mass)
    total_fuel_need(fuel_for_curr_mass, total + fuel_for_curr_mass)
end

p File.read('input/1').split("\n").map { |s| s.to_i }.map { |i| total_fuel_need(i) }.sum