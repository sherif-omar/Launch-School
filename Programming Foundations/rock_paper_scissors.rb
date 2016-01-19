VALID_CHOICES = %w(rock  paper  scissors)
def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)

    prompt("You won!")

  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end
loop do # Main loop
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a vild choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; computer chose: #{computer_choice}")
  display_result(choice, computer_choice)

  prompt("Do you want to play again? (Y) or (N)")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
