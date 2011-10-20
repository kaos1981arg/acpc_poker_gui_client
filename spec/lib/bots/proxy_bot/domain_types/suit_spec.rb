require 'spec_helper'

require File.expand_path('../../../../../../lib/helpers/application_helpers', __FILE__)

describe Suit do
   include ApplicationHelpers
   
   describe '#initialization' do
      it 'raises an exception if the given suit is invalid' do
         expect{Suit.new(:not_a_suit)}.to raise_exception(Suit::NotARecognizedSuit)
      end
      it 'correctly understands all suits currently recognized' do
         for_every_suit_in_the_deck { |suit| Suit.new(suit) }
      end
   end
   describe '#to_i' do
      it 'converts every suit into its proper numeric ACPC representation' do
         for_every_suit_in_the_deck do |suit|
            patient = Suit.new suit
            
            string_suit = CARD_SUITS[:suit]
            integer_suit = CARD_SUIT_NUMBERS[string_suit]
            
            patient.to_i.should eq(integer_suit)
         end
      end
   end
   describe '#to_s' do
      it 'converts every suit into its proper string representation' do
         for_every_suit_in_the_deck do |suit|
            patient = Suit.new suit
            
            string_suit = CARD_SUITS[:suit]
            
            patient.to_s.should eq(string_suit)
         end
      end
   end   
end