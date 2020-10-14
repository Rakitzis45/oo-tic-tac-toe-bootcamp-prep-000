class TicTacToe
    attr_accessor :board

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [0,3,6],
        [0,4,8],
        [1,4,7],
        [3,4,5],
        [2,4,6],
        [6,7,8],
        [2,5,8]
]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, player= "X")
        @board[index] = player
    end

    def position_taken?(index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
          false
        else
          true
        end
      end

    def valid_move?(index)
        if index.between?(0, 8) && !position_taken?(index)
          true
        else
          false
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
        else
          turn
        end
        display_board
      end

      def turn_count
        @board.count{|box| box != " "}
      end

      def current_player
        if turn_count.even?
        "X"
        else
        "O"
        end
      end

      def won?
        WIN_COMBINATIONS.each do |winner|
          index_0 = winner[0]
          index_1 = winner[1]
          index_2 = winner[2]

          position_1 = board[index_0]
          position_2 = board[index_1]
          position_3 = board[index_2]
          if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
             position_1 == "O" && position_2 == "O" && position_3 == "O"
            return winner
          end
        end
          false
      end

      def full?
        board.all?{|player| player == "X" || player == "O"}
      end

      def draw?
        if full?&& !won?
          true
        end
      end

      def over?
        if won? || full? || draw?
          true
        end
      end

      def winner
        if winner = won?
          @board[winner.first]
        end
      end

      def play
        turn until over?
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end
end
