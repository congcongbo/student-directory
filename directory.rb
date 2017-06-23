def input_students
    puts "Please enter names of students"
    puts "Hit return twice to finish"
    students = []
    name = gets.chomp
    while !name.empty? do
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      name = gets.chomp
    end
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |x| puts "#{x[:name]} (#{x[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
