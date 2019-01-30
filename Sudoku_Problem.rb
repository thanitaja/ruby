def in_row(input,i,k)
  input[i].include? k
end

def in_col(input,j,k,size)
  for i in 0...size
    if input[i][j] == k
      return true
    end
  end
  false
end

def in_squre(input,i,j,k,size)
  x,y =0,0
  if size == 9
    x = 3 if i > 2
    x = 6 if i > 5
    y = 3 if j > 2
    y = 6 if j > 5
      for xx in x..x+2
        for yy in y..y+2
            if input[xx][yy] == k
              return true
           end
        end
      end
  elsif size == 16
    x = 4 if i > 3
    x = 8 if i > 7
    x = 12 if i > 11
    y = 4  if j > 3
    y = 8 if j > 7
    y = 12 if j > 11
  for xx in x..x+3
        for yy in y..y+3
            if input[xx][yy] == k
              return true
           end
        end
      end
  else
    x = 2 if i > 1
    y = 2 if j > 1
     for xx in x..x+1
        for yy in y..y+1
            if input[xx][yy] == k
              return true
           end
        end
      end
  end
  return false
end

def find_x(input)
input.each_with_index do |rows,i|
  rows.each_with_index do |cols,j|
    if cols == 0
      return [i,j] 
    end
  end
end    
false
end 


def solution (input,size)
point = find_x(input)
unless point
  return [true,input] 
end 
i,j = point[0],point[1]
for k in 0..size
  if in_row(input,i,k) || in_col(input,j,k,size) || in_squre(input,i,j,k,size)
    next
  end
  input[i][j] = k
  if solution(input,size)[0] == true 
    return [true,input]  
  end
  input[i][j] = 0 
end
return [false,input]
end


num = gets.chomp
num = num.split(" ")
x,y = num[0].to_i , num[1].to_i
input = Array.new(x)
for i in 0...x
input[i] = gets.chomp
end

for i in 0...x
input[i] = input[i].split(" ")
end

for i in 0...y
for j in 0...x
  unless input[i][j].eql?("x")
      if input[i][j].eql?("A")
        input[i][j] = 10
      elsif input[i][j].eql?("B")
        input[i][j] = 11
      elsif input[i][j].eql?("C")
        input[i][j] = 12
      elsif input[i][j].eql?("D")
        input[i][j] = 13
      elsif input[i][j].eql?("E")
        input[i][j] = 14
      elsif input[i][j].eql?("F")
        input[i][j] = 15
      elsif input[i][j].eql?("G")
        input[i][j] = 16
      else
        input[i][j] = input[i][j].to_i  
      end      
  else
      input[i][j] = 0
  end
end
end

solution(input,x)

if x==16
for i in 0...16
  for j in 0...16
    if input[i][j].eql?(10)
        input[i][j] = A
      elsif input[i][j].eql?(11)
        input[i][j] = B
      elsif input[i][j].eql?(12)
        input[i][j] = C
      elsif input[i][j].eql?(13)
        input[i][j] = D
      elsif input[i][j].eql?(14)
        input[i][j] = E
      elsif input[i][j].eql?(15)
        input[i][j] = F
      elsif input[i][j].eql?(16)
        input[i][j] = G
      else
        input[i][j] = input[i][j] 
      end      
  end
end
end 

for k in 0...x
print input[k]
print "\n"
end
