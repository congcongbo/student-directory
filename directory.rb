@students = []

def input_students
    puts "Please enter names and cohorts of students"
    puts "Hit return once after name and twice to finish"
    name = gets.chomp
    puts "Which cohort?"
    cohort = STDIN.gets.chomp
    while !name.empty? do
      @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students"
      name = STDIN.gets.chomp
      cohort = STDIN.gets.chomp
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
  puts "3. Save the list to students.csv"
  puts "4. Load student list from students.csv"
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
    puts "You chose to add students."
    input_students
  when "2"
    puts "You chose to list students."
    show_students
  when "3"
    puts "Saved."
    save_students
  when "4"
    puts "Loading"
    load_students
  when "9"
    puts "Successfully exiting programme."
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
  end
    file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students(filename = "students.csv")
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
