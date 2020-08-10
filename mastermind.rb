puts "-------\n Let's play mastermind! Random 4 color code has been created by hacker."
puts "You should crack the code by guessing and typing the color code. You only can use one color in the list"
puts "There are 10 chances to guess. Each round, the hacker will give you a hint. if you guess both a position of color code and color correctly, the hacker will give you a 'strike'"
puts "If a color only matches with original code but not the direction, it will give ball. if nothing matches, it will return nothing. Alrightly, let's start!\n-------"

$color = ["red", "orange", "yellow", "green", "blue", "violet", "black", "white"]
$chosenCodes= []

while $chosenCodes.length < 4
    @choice= $color.sample
    unless $chosenCodes.include?(@choice)
        $chosenCodes << @choice
    end
end

puts $chosenCodes

class GuessCode
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end

prompt = "type a color code"

answerCodes = [
    GuessCode.new(prompt, $chosenCodes[0]),
    GuessCode.new(prompt, $chosenCodes[1]),
    GuessCode.new(prompt, $chosenCodes[2]),
    GuessCode.new(prompt, $chosenCodes[3])
]

for i in 1..10
    $answer = ""
    $result = []
    $value = "Strike"

    for answerCode in answerCodes
        puts (answerCodes.find_index(answerCode) + 1).to_s + ". " + answerCode.prompt
        $color.delete($answer)
        print "color choice :" + $color.join(" ") + "\n"

        $answer = gets.chomp()
        if $answer == answerCode.answer
            $result << "1 Strike"
        elsif $chosenCodes.include?($answer)
            $result << "1 Ball"
        end
    end
    puts $result
    if ($result.all?($value)) && ($result.length == 4)
        puts "Congratuations! You win!"
        break
    else 
        puts "Hmm, it has \n*"
        puts $result.shuffle.join(" ")
        puts "* \n Let's try again. You have #{10-i} chances left. \n --------"
    end

end    



    


