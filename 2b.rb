instructions = File.read('input/2').split(",").map { |s| s.to_i }

def arr_add(arr, i, j)
    puts "Adding bits at positions #{i} and #{j}"
    arr[i] + arr[j]
end

def arr_mult(arr, i, j)
    puts "Multiplying bits at positions #{i} and #{j}"
    arr[i] * arr[j]
end

def arr_store(arr, p, v)
    puts "Storing new value #{v} at position #{p}"
    arr[p] = v
end

def run(arr)
    instr_bit = 0
    while true
        puts "Reading instruction code at bit #{instr_bit}"
        instr = arr[instr_bit]
        puts "Instruction code received: #{instr}"
        case instr
        when 99
            return
        when 1
            value = arr_add(arr, arr[instr_bit+1], arr[instr_bit+2])
            arr_store(arr, arr[instr_bit + 3], value)
        when 2
            value = arr_mult(arr, arr[instr_bit+1], arr[instr_bit+2])
            arr_store(arr, arr[instr_bit + 3], value)
        else
            raise "Invalid instruction code: #{instr}"
        end
        instr_bit += 4
    end
end

def find_combination(instructions)
    100.times do |noun|
        100.times do |verb|
            arr = instructions.dup
            puts "Running program with noun #{noun} & verb #{verb}"
            arr[1] = noun
            arr[2] = verb
            run(arr)
            output = arr[0].to_i
            if output == 19_690_720
                puts "Noun #{noun} and verb #{verb} yield a correct output"
                return noun, verb
            end
        end
    end
    raise 'No combination found.'
end

def solution(noun, verb)
    100 * noun + verb
end

noun, verb = find_combination(instructions)
puts solution(noun, verb)
