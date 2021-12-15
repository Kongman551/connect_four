require "colorize"

module Display
    def welcome
        print "  "
        puts "CONNECT FOUR\n".red.underline
    end

    def empty_space
        "\u25cc"
    end

    def red_space
        "\u25cf".red
    end

    def blue_space
        "\u25cf".blue
    end

    def ask_name(player)
        print "\n Enter your name #{player}: "
    end

    def ask_move(player)
        print "\n #{player} make your move: "
    end

    def congrats(player)
        puts "\n Congratulations #{player}!!".red
    end

    def clear
        system 'clear'
        welcome
    end
end