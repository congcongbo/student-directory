def input_students
    students = []
    puts "Please enter names and cohorts of students"
    puts "Hit return twice to finish"
    name = gets.chomp
    puts "Which cohort?"
    cohort = gets.chomp
    while !name.empty? do
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
      name = gets.chomp
      cohort = gets.chomp
    end
    students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(names)
  if names.length <0
    names.each_with_index { |x,i| puts "#{i+1}. #{x[:name]} (#{x[:cohort]} cohort)" }
  else
    puts "We have no students yet"
  end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students" unless names.length == 0
end

def interactive_menu
  students = []
  loop do
    puts "1. Input students"
    puts "2. List students"
    puts "9. Exit"
    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_students(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
