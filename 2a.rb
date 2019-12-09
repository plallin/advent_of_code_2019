instructions = File.read('input/2').split(",").map { |s| s.to_i }
instructions[1] = 12
instructions[2] = 2

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

def test(arr, expec)
    run(arr)
    if arr[0] != expec
        p arr
        raise "Expected #{expec}, got #{arr[0]}"
    end
    puts "Test successful"
end

test([1,9,10,3,2,3,11,0,99,30,40,50], 3500)
test([1,0,0,0,99], 2)
test([2,3,0,3,99], 2)
test([2,4,4,5,99,0], 2)
test([1,1,1,4,99,5,6,0,99], 30)

run(instructions)
puts "The solution is: #{instructions[0]}"