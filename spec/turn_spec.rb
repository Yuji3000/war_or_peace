require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

describe Turn do
    it 'exists' do
			card1 = Card.new(:heart, 'Jack', 11)
			card2 = Card.new(:heart, '10', 10)
			card3 = Card.new(:heart, '9', 9)   
			card4 = Card.new(:diamond, 'Jack', 11)
			card5 = Card.new(:heart, '8', 8)
			card6 = Card.new(:diamond, 'Queen', 12)
			card7 = Card.new(:heart, '3', 3)
			card8 = Card.new(:diamond, '2', 2)
			deck1 = Deck.new([card1, card2, card5, card8])
			deck2 = Deck.new([card3, card4, card6, card7])
			player1 = Player.new("Megan", deck1)
			player2 = Player.new("Aurora", deck2)
			players = [player1, player2]
			turn = Turn.new(player1, player2)
			expect(turn).to be_a(Turn)
	   end

      it 'has players' do
		  	card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card3, card4, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				expect(player1).to eq(turn.player1)
				expect(player2).to eq(turn.player2)
			end 

			it 'tests if spoils of war starts empty' do
				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card3, card4, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				expect(turn.spoils_of_war).to eq([])
			end

			it 'tests for winner' do
			  card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card3, card4, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
        expect(turn.winner).to eq(player1)
		  end

			it 'tests if cards go to spoils of war for each turn type ' do
				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card3, card4, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				expect(turn.spoils_of_war).to eq([])
				expect(turn.type).to eq(:basic)
				turn.pile_cards
				expect(turn.spoils_of_war).to eq([card1, card3])

				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card4, card3, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				expect(turn.spoils_of_war).to eq([])
				expect(turn.type).to eq(:war)
				turn.pile_cards
				expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])

				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, '8', 8)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card4, card3, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				expect(turn.spoils_of_war).to eq([])
				expect(turn.type).to eq(:mutually_assured_destruction)
				turn.pile_cards
				expect(turn.spoils_of_war).to eq([])
				end

			describe '#award_spoils'
			it'tests if spoils go to winner basic turn' do
				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card3, card4, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				winner = turn.winner
				turn.pile_cards
				turn.spoils_of_war
				expect(turn.spoils_of_war).to eq([card1, card3])
				turn.award_spoils(winner)
				expect(player1.deck.cards).to eq ([card2, card5, card8, card1, card3])
				expect(player2.deck.cards).to eq([card4, card6, card7])
			end
			
			it'tests if spoils go to winner war turn' do
				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, 'Queen', 12)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card4, card3, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				turn.type
				expect(turn.type).to eq(:war)
				winner = turn.winner
				turn.pile_cards
				turn.spoils_of_war
				expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
				turn.award_spoils(winner)
				expect(player1.deck.cards).to eq([card8])
				expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
			end
			
			it'tests m.a.d. no winner' do
				card1 = Card.new(:heart, 'Jack', 11)
				card2 = Card.new(:heart, '10', 10)
				card3 = Card.new(:heart, '9', 9)   
				card4 = Card.new(:diamond, 'Jack', 11)
				card5 = Card.new(:heart, '8', 8)
				card6 = Card.new(:diamond, '8', 8)
				card7 = Card.new(:heart, '3', 3)
				card8 = Card.new(:diamond, '2', 2)
				deck1 = Deck.new([card1, card2, card5, card8])
				deck2 = Deck.new([card4, card3, card6, card7])
				player1 = Player.new("Megan", deck1)
				player2 = Player.new("Aurora", deck2)
				players = [player1, player2]
				turn = Turn.new(player1, player2)
				turn.type
				expect(turn.type).to eq(:mutually_assured_destruction)
				winner = turn.winner
				expect(turn.winner).to eq("No Winner")
				turn.pile_cards
				turn.spoils_of_war
				expect(turn.spoils_of_war).to eq([])
				expect(player1.deck.cards).to eq([card8])
				expect(player2.deck.cards).to eq([card7])
			end
	end