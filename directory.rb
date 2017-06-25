@students = []

def input_students
    puts "Please enter names and cohorts of students"
    puts "Hit return once after name and twice to finish"
    name = gets.chomp
    puts "Which cohort?"
    cohort = gets.chomp
    while !name.empty? do
      @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students"
      name = gets.chomp
      cohort = gets.chomp
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  if @students.length >0
    @students.each_with_index { |x,i| puts "#{i+1}. #{x[:name]} (#{x[:cohort]} cohort)" }
  else
    puts "We have no students yet"
  end
end

def print_footer
    puts "Overall, we have #{@students.count} great students" unless @students.length == 0
end

def print_menu
  puts "1. Input students"
  puts "2. List students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
